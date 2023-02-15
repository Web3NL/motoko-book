import RB "mo:base/RBTree";
import Hash "mo:base/Hash";
import Time "mo:base/Time";
import List "mo:base/List";

import Types "types";
import Utils "utils";

module {
    type Comment = Types.Comment;
    type CommentHash = Hash.Hash;

    // Return total number of comments
    public func totalComments(commentsTree : Types.CommentsTree) : Nat {
        RB.size<CommentHash, Comment>(commentsTree.share())
    };

    // Construct a comment, compute its hash, store comment in RBTree, store hash in List 
    public func postComment(
        owner : Principal, 
        text : Text, 
        commentsHashHistory : Types.CommentsHashHistory, 
        commentsTree : Types.CommentsTree
        ) : ?Types.CommentsHashHistory {
        if (not Utils.checkCommentSize(text)) return null;

        let created = Time.now();

        let comment : Comment = {
            created;
            owner;
            text;
        };

        let hash : CommentHash = Utils.hashComment(comment);

        commentsTree.put(hash, comment);
        ?List.push<CommentHash>(hash, commentsHashHistory);
    };

    // Retrieve last n comments
    public func getComments(
        n : Nat, 
        commentsHashHistory : Types.CommentsHashHistory,
        commentsTree : Types.CommentsTree
        ) : [Comment] {

        // Collect last n CommentHashes in a list
        let latestHashes = List.take(commentsHashHistory, n);

        // Collect last n Comments in a list
        let latestComments = List.mapFilter<CommentHash, Comment>(
            latestHashes,
            func(h){ commentsTree.get(h) }
        );

        // Convert list to array
        List.toArray(latestComments)
    };
}