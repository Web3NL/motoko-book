import Nat "mo:base/Nat";
import Time "mo:base/Time";
import List "mo:base/List";
import Error "mo:base/Error";

import Types "Types";
import Constants "Constants";
import {
    validateComment;
    hashComment;
    userToQueryUser;
} "Utils";

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

        let (treasury, users, commentStore, commentHistory) = stores;

        switch (users.get(owner)) {
            case (null) { #err(#UserNotFound) };
            case (?user) {
                let now = Time.now();

                if (now - user.lastPost < Constants.COMMENT_INTERVAL) {
                    return #err(#TimeRemaining(Constants.COMMENT_INTERVAL - (now - user.lastPost)));
                };

                let postComment : Comment = {
                    created = now;
                    owner;
                    comment;
                    reward = 0;
                };
                let hash = hashComment(postComment);

                treasury[0] -= Constants.COMMENT_REWARD;
                let balance = user.balance + Constants.COMMENT_REWARD;

                let newUser : User = {
                    user with
                    balance;
                    lastPost = now;
                    likes = List.make<CommentHash>(hash);
                };

                users.put(owner, newUser);

                commentStore.put(hash, postComment);

                commentHistory[0] := List.push<CommentHash>(hash, commentHistory[0]);

                #ok();
            };
        };
    };

    public func likeComment(stores : Stores, hash : CommentHash, liker : Principal) : async* LikeResult {
        let (treasury, users, commentStore, _) = stores;

        switch (users.get(liker)) {
            case (null) { return #err(#UserNotFound) };
            case (?user) {
                let now = Time.now();

                if (List.some<CommentHash>(user.likes, func(h : CommentHash) : Bool { h == hash })) {
                    return #err(#AlreadyLiked);
                };

                if (now - user.lastLike < Constants.LIKE_INTERVAL) {
                    return #err(#TimeRemaining(Constants.LIKE_INTERVAL - (now - user.lastLike)));
                };

                let newUser : User = {
                    user with
                    lastLike = now;
                    lastPost = now;
                    likes = List.push<CommentHash>(hash, user.likes);
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
                        let reward = comment.reward + Constants.LIKE_REWARD;
                        let balance = owner.balance + Constants.LIKE_REWARD;

                        let newComment : Comment = {
                            comment with
                            reward;
                        };

                        let newOwner : User = {
                            owner with
                            balance;
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
