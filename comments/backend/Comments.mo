import Nat "mo:base/Nat";
import Time "mo:base/Time";
import List "mo:base/List";
import Error "mo:base/Error";

import Types "Types";
import Constants "Constants";
import { validateComment; hashComment; userToQueryUser } "Utils";

module {
    type Stores = Types.Stores;
    type Users = Types.Users;

    type User = Types.User;

    type Comment = Types.Comment;
    type CommentHash = Types.CommentHash;

    type PostResult = Types.PostResult;
    type LikeResult = Types.LikeResult;

    type QueryComment = Types.QueryComment;
    type QueryUser = Types.QueryUser;

    public func postComment(stores : Stores, owner : Principal, comment : Text) : PostResult {
        if (not validateComment(comment)) return #err(#InvalidComment);

        let now = Time.now();

        let postComment : Comment = {
            created = now;
            owner;
            comment;
            reward = 0;
        };

        let hash = hashComment(postComment);

        let (treasury, users, commentStore, commentHistory) = stores;

        switch (users.get(owner)) {
            case (null) {
                treasury[0] -= Constants.COMMENT_REWARD;

                let newUser : User = {
                    id = users.size() + 1;
                    balance = Constants.COMMENT_REWARD;
                    lastPost = now;
                    lastLike = now;
                    likes = List.nil<CommentHash>();
                };

                users.put(owner, newUser);
            };
            case (?user) {
                if (now - user.lastPost < Constants.MAX_INTERVAL_USER_COMMENT) {
                    return #err(#TimeRemaining(Constants.MAX_INTERVAL_USER_COMMENT - (now - user.lastPost)));
                };

                treasury[0] -= Constants.COMMENT_REWARD;

                let newUser : User = {
                    user with
                    balance = user.balance + Constants.COMMENT_REWARD;
                    lastPost = now;
                };

                users.put(owner, user);
            };
        };

        commentStore.put(hash, postComment);

        commentHistory[0] := List.push<CommentHash>(hash, commentHistory[0]);

        #ok();
    };

    public func likeComment(stores : Stores, hash : CommentHash, liker : Principal) : async* LikeResult {
        let now = Time.now();

        let (treasury, users, commentStore, _) = stores;

        switch (users.get(liker)) {
            case (?user) {
                if (now - user.lastLike < Constants.MAX_INTERVAL_USER_LIKE) {
                    return #err(#TimeRemaining(Constants.MAX_INTERVAL_USER_LIKE - (now - user.lastLike)));
                };

                if (List.some<CommentHash>(user.likes, func(h : CommentHash) : Bool { h == hash })) {
                    return #err(#AlreadyLiked);
                };

                let newUser : User = {
                    user with
                    lastLike = now;
                    lastPost = now;
                    likes = List.push<CommentHash>(hash, user.likes);
                };

                users.put(liker, newUser);
            };
            case (null) {
                let newUser : User = {
                    id = users.size() + 1;
                    balance = 0;
                    lastPost = now;
                    lastLike = now;
                    likes = List.make<CommentHash>(hash);
                };

                users.put(liker, newUser);
            };
        };

        switch (commentStore.get(hash)) {
            case (null) throw Error.reject("Comment not found");
            case (?comment) {
                switch (users.get(comment.owner)) {
                    case (null) {
                        throw Error.reject("Comment has no owner");
                    };
                    case (?owner) {
                        treasury[0] -= Constants.LIKE_REWARD;

                        let newComment : Comment = {
                            comment with
                            reward = comment.reward + Constants.LIKE_REWARD;
                        };

                        let newOwner : User = {
                            owner with
                            balance = owner.balance + Constants.LIKE_REWARD;
                        };

                        commentStore.put(hash, newComment);
                        users.put(comment.owner, newOwner);

                        #ok(newComment.reward);
                    };

                };
            };
        };

    };

    public func latestComments(stores : Stores) : [QueryComment] {
        let (_, users, commentStore, commentHistory) = stores;

        let latestHashes = List.take<CommentHash>(commentHistory[0], 10);

        let comments = List.mapFilter<CommentHash, QueryComment>(
            latestHashes,
            func(hash : CommentHash) : ?QueryComment {
                switch (commentStore.get(hash)) {
                    case (null) return null;
                    case (?comment) {
                        switch (users.get(comment.owner)) {
                            case (null) return null;
                            case (?user) {
                                let userId = "User" # Nat.toText(user.id);
                                ?{
                                    created = comment.created;
                                    userId;
                                    reward = comment.reward;
                                    comment = comment.comment;
                                    hash;
                                };
                            };
                        };
                    };
                };
            },
        );
        List.toArray(comments);
    };

    public func register(users : Users, principal : Principal) : QueryUser {
        switch (users.get(principal)) {
            case (null) {
                let newUser : User = {
                    id = users.size() + 1;
                    balance = 0;
                    lastPost = 0;
                    lastLike = 0;
                    likes = List.nil<CommentHash>();
                };

                users.put(principal, newUser);

                userToQueryUser(newUser);
            };
            case (?user) { userToQueryUser(user) };
        };
    };

};
