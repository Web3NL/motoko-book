// Tokenized Comments Example
// For demonstration purposes only.
// Tokens are not transferable.
// Tokenomics model is not realistic.

import Array "mo:base/Array";
import List "mo:base/List";
import Iter "mo:base/Iter";
import Hash "mo:base/Hash";
import Error "mo:base/Error";
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
    type QueryUser = Types.QueryUser;

    // STABLE DATA STORES
    stable var treasury : Treasury = [var Constants.TOTAL_SUPPLY];

    stable var stableUsers : [(Principal, User)] = [];
    stable var stableCommentStore : [(CommentHash, Comment)] = [];
    stable var stableCommentHistory : [CommentHash] = [];

    // INIT DATA STORES FROM STABLE DATA
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

    // PUBLIC METHODS

    public shared (msg) func register() : async QueryUser {
        // Anonymous users cannot register
        if (Principal.isAnonymous(msg.caller)) throw Error.reject("Anonymous users cannot register");

        Comments.register(users, msg.caller);
    };

    public shared (msg) func postComment(comment : Text) : async PostResult {
        // Anonymous users cannot post comments
        if (Principal.isAnonymous(msg.caller)) return #err(#AnonNotAllowed);

        let stores : Stores = (treasury, users, commentStore, commentHistory);

        Comments.postComment(stores, msg.caller, comment);
    };

    public shared (msg) func likeComment(hash : CommentHash) : async LikeResult {
        // Anonymous users cannot like comments
        if (Principal.isAnonymous(msg.caller)) return #err(#AnonNotAllowed);

        let stores : Stores = (treasury, users, commentStore, commentHistory);

        await* Comments.likeComment(stores, hash, msg.caller);
    };

    public query func latestComments() : async [QueryComment] {
        // Anonymous users can query comments

        let stores : Stores = (treasury, users, commentStore, commentHistory);

        Comments.latestComments(stores);
    };

    public query func tokenTreasury() : async Nat {
        // Anon users can query treasury
        treasury[0];
    };

    // UPGRADING

    // Save state to stable arrays
    system func preupgrade() {
        stableUsers := Iter.toArray<(Principal, User)>(
            users.entries()
        );

        stableCommentStore := Iter.toArray<(CommentHash, Comment)>(
            commentStore.entries()
        );

        stableCommentHistory := List.toArray<CommentHash>(
            commentHistory[0]
        );
    };

    // Empty stable arrays to save memory
    system func postupgrade() {
        stableUsers := [];
        stableCommentStore := [];
        stableCommentHistory := [];
    };
};
