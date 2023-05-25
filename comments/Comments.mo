import Nat "mo:base/Nat";
import Time "mo:base/Time";
import List "mo:base/List";
import Error "mo:base/Error";

import Types "Types";
import Constants "Constants";
import { validateComment; hashComment } "Utils";

module {
    type Stores = Types.Stores;

    type Comment = Types.Comment;
    type CommentHash = Types.CommentHash;

    type QueryComment = Types.QueryComment;
    type PostResult = Types.PostResult;

    type Reward = Types.Reward;

    public func postComment(stores : Stores, owner : Principal, comment : Text) : PostResult {
        // check time

        if (validateComment(comment)) return #err(#InvalidComment);

        let now = Time.now();

        let postComment : Comment = {
            created = now;
            owner;
            comment;
        };

        let hash = hashComment(postComment);

        let (treasury, users, commentStore, commentHistory) = stores;

        treasury[0] -= Constants.COMMENT_REWARD;

        switch (users.get(owner)) {
            case (?(id, balance, _)) {
                users.put(owner, (id, balance + Constants.COMMENT_REWARD, now));
            };
            case (null) {
                users.put(owner, (users.size() + 1, Constants.COMMENT_REWARD, now));
            };
        };

        commentStore.put(
            hash,
            (postComment, Constants.COMMENT_REWARD),
        );

        commentHistory[0] := List.push<CommentHash>(
            hash,
            commentHistory[0],
        );

        #ok();
    };

    public func likeComment(stores : Stores, hash : CommentHash) : async* ?() {
        let (treasury, users, commentStore, _) = stores;

        switch (commentStore.get(hash)) {
            case (?(comment, reward)) {
                switch (users.get(comment.owner)) {
                    case (null) {
                        throw Error.reject("Comment has now owner");
                    };
                    case (?(id, balance, lastPost)) {
                        treasury[0] -= Constants.COMMENT_REWARD;
                        commentStore.put(hash, (comment, reward + Constants.LIKE_REWARD));
                        users.put(comment.owner, (id, balance + Constants.LIKE_REWARD, lastPost));
                    };

                };
            };
            case (null) return null;
        };
        ?();
    };

    // func latestComments(stores : Stores) : async* [QueryComment] {
    //     let (_, users, commentStore, commentHistory) = stores;

    //     let latestHashes = List.take<CommentHash>(commentHistory[0], 10);

    //     let comments = List.map<CommentHash, QueryComment>(
    //         latestHashes,
    //         func(hash : CommentHash) : QueryComment {
    //             switch (commentStore.get(hash)) {
    //                 case (null) {
    //                     // throw Error.reject("Comment not found");
    //                 };
    //                 case (?(comment, reward)) {
    //                     let ?(id, balance, lastPost) = users.get(comment.owner);
    //                     let userId = "User" # Nat.toText(id);

    //                     {
    //                         created = comment.created;
    //                         userId;
    //                         userBalance = balance;
    //                         comment = comment.comment;
    //                     };
    //                 };
    //             };
    //         },
    //     );
    //     List.toArray(comments);
    // };
};
