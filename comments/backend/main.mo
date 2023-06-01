// Tokenized Comments Example
// For demonstration purposes only.
// Tokens are not transferable.

// import Time "mo:base/Time";
// import Int "mo:base/Int";
import Array "mo:base/Array";
import List "mo:base/List";
import Hash "mo:base/Hash";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";

import Types "Types";
import Constants "Constants";
import Utils "Utils";
import Comments "Comments";

actor {
    type User = Types.User;

    type Comment = Types.Comment;
    type CommentHash = Types.CommentHash;

    type Treasury = Types.Treasury;
    type Users = Types.Users;
    type CommentStore = Types.CommentStore;
    type CommentHistory = Types.CommentHistory;

    type Stores = Types.Stores;

    type PostResult = Types.PostResult;
    type LikeResult = Types.LikeResult;
    type QueryComment = Types.QueryComment;

    stable var treasury : Treasury = [var Constants.TOTAL_SUPPLY];

    stable var stableUsers : [(Principal, User)] = [];
    stable var stableCommentStore : [(CommentHash, Comment)] = [];
    stable var stableCommentHistory : [CommentHash] = [];

    let users : Users = HashMap.fromIter<Principal, User>(
        Array.vals(stableUsers),
        1000,
        Principal.equal,
        Principal.hash,
    );

    let commentStore : CommentStore = HashMap.fromIter<CommentHash, Comment>(
        Array.vals(stableCommentStore),
        10_000,
        Hash.equal,
        Utils.hash,
    );

    let commentHistory : CommentHistory = [var List.fromArray<CommentHash>(stableCommentHistory)];

    public shared (msg) func postComment(comment : Text) : async PostResult {
        if (Principal.isAnonymous(msg.caller)) return #err(#AnonNotAllowed);

        let stores : Stores = (treasury, users, commentStore, commentHistory);

        Comments.postComment(stores, msg.caller, comment);
    };

    public shared (msg) func likeComment(hash : CommentHash) : async LikeResult {
        if (Principal.isAnonymous(msg.caller)) return #err(#AnonNotAllowed);

        let stores : Stores = (treasury, users, commentStore, commentHistory);

        await* Comments.likeComment(stores, hash, msg.caller);
    };

    public query func latestComments() : async [QueryComment] {
        let stores : Stores = (treasury, users, commentStore, commentHistory);

        Comments.latestComments(stores);
    };

    public query func tokenTreasury() : async Nat { treasury[0] };

    public shared query (msg) func user() : async ?User {
        switch (users.get(msg.caller)) {
            case null return null;
            case (?user) return ?user;
        };
    };
};
