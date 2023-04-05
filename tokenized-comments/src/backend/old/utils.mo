import Hash "mo:base/Hash";
import Text "mo:base/Text";
import Int "mo:base/Int";
import Principal "mo:base/Principal";

import Cons "constants";
import Types "types";

module {
    type Comment = Types.Comment;
    type CommentHash = Types.CommentHash;

    // Custom comment hash
    public func commentHash(comment : Comment) : CommentHash {
        let created = Int.toText(comment.created);
        let owner = Principal.toText(comment.owner);
        
        let data = created # owner # comment.text;

        Text.hash(data)
    };

    // Compute the order of two comment hashes
    public func commentEqual(h1 : CommentHash, h2 : CommentHash) : Bool {
        h1 == h2
    };

    // Check comment size
    public func checkCommentSize(text : Text) : Bool {
        let size = text.size();
        size >= Cons.MIN_COMMENT_SIZE and size <= Cons.MAX_COMMENT_SIZE
    };
}