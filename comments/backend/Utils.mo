import Hash "mo:base/Hash";
import Principal "mo:base/Principal";
import Int "mo:base/Int";
import Text "mo:base/Text";
import List "mo:base/List";

import Types "Types";
import Constants "Constants";

module {
    type Hash = Hash.Hash;

    type Comment = Types.Comment;
    type CommentHash = Types.CommentHash;

    type User = Types.User;
    type QueryUser = Types.QueryUser;

    type Treasury = Types.Treasury;

    // Compare function for comments
    public func compareComment(c1 : Comment, c2 : Comment) : Bool {
        c1.created == c2.created and c1.owner == c2.owner and c1.comment == c2.comment
    };

    // Hash function for comments
    public func hashComment(c : Comment) : Hash {
        let created = Int.toText(c.created);
        let owner = Principal.toText(c.owner);

        Text.hash(created # owner # c.comment);
    };

    // Identity function for hash
    public func hash(h : Hash) : Hash = h;

    // Comment size validation
    public func validateComment(c : Text) : Bool {
        c.size() <= Constants.MAX_COMMENT_SIZE;
    };

    // User record conversion
    public func userToQueryUser(user : User) : QueryUser {
        {
            id = user.id;
            balance = user.balance;
            lastLike = user.lastLike;
            lastPost = user.lastPost;
            likes = List.toArray<CommentHash>(user.likes);
        } : QueryUser;
    };

    // Check treasury balance
    public func fundsAvalaible(t : Treasury, amount : Nat) : Bool {
        t[0] >= amount;
    };
};
