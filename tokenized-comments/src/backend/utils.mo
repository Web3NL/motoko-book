import Hash "mo:base/Hash";
import Text "mo:base/Text";
import Int "mo:base/Int";
import Principal "mo:base/Principal";
import Order "mo:base/Order";

import Cons "constants";
import Types "types";

module {

    // Rename our Hash type
    type CommentHash = Types.CommentHash;

    // Custom comment hash
    public func hashComment(comment : Types.Comment) : CommentHash {
        let created = Int.toText(comment.created);
        let owner = Principal.toText(comment.owner);
        
        let data = created # owner # comment.text;

        Text.hash(data)
    };

    // Compute the order of two comment hashes
    public func commentHashCompare(h1 : CommentHash, h2 : CommentHash) : Order.Order {
        switch (h1 == h2) {
            case true return #equal;
            case false {
                switch (h1 > h2) {
                    case true return #greater;
                    case false return #less;
                };
            };
        };
    };

    // Check comment size
    public func checkCommentSize(text : Text) : Bool {
        let size = text.size();
        size >= Cons.MIN_COMMENT_SIZE and size <= Cons.MAX_COMMENT_SIZE
    };
}