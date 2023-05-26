import Hash "mo:base/Hash";
import Principal "mo:base/Principal";
import Int "mo:base/Int";
import Text "mo:base/Text";

import Types "Types";
import Constants "Constants";

module {
    type Comment = Types.Comment;
    type Hash = Hash.Hash;

    public func compareComment(c1 : Comment, c2 : Comment) : Bool {
        c1.created == c2.created and c1.owner == c2.owner and c1.comment == c2.comment
    };

    public func hashComment(c : Comment) : Hash {
        let created = Int.toText(c.created);
        let owner = Principal.toText(c.owner);
        
        Text.hash(created # owner # c.comment)
    };

    public func hash(h : Hash) : Hash = h;

    public func validateComment(c : Text) : Bool { 
        c.size() <= Constants.MAX_COMMENT_SIZE
    };
};
