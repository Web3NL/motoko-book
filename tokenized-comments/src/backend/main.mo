import Result "mo:base/Result";
import Array "mo:base/Array";
import RB "mo:base/RBTree";
import Hash "mo:base/Hash";
import Time "mo:base/Time";
import List "mo:base/List";

import Cons "constants";
import Types "types";
import Utils "utils";

actor {
    type Comment = Types.Comment;
    type CommentHash = Hash.Hash;

    private let comments = RB.RBTree<CommentHash, Comment>(Utils.commentHashCompare);
    private var commentsHistory : Types.CommentHistory = List.nil<CommentHash>();

    // Return total number of comments
    private func _totalComments() : Nat {
        RB.size<CommentHash, Comment>(comments.share())
    };

    // Construct a comment, compute its hash, store comment in RBTree, store hash in List 
    private func _putComment(owner : Principal, text : Text) {
        if (not Utils.checkCommentSize(text)) return ();

        let created = Time.now();

        let comment : Comment = {
            created;
            owner;
            text;
        };

        let hash : CommentHash = Utils.hashComment(comment);

        commentsHistory := List.push<CommentHash>(hash, commentsHistory);
        comments.put(hash, comment)
    };

    // Retrieve last n comments
    private func _getComments(n : Nat) : [Comment] {
        // Collect last n CommentHashes in a list
        let latestHashes = List.take(commentsHistory, n);

        // Collect last n Comments in a list
        let latestComments = List.mapFilter<CommentHash, Comment>(
            latestHashes,
            func(h){ comments.get(h) }
        );

        // Convert list to array
        List.toArray(latestComments)
    };

    public query func totalComments() : async Nat { _totalComments() };

    public shared ({caller = owner}) func postComment(text : Text) {
        _putComment(owner, text)
    };

    public query func getComments(n : Nat) : async [Comment] {
        _getComments(n)
    };

}