import Result "mo:base/Result";
import Array "mo:base/Array";
import RB "mo:base/RBTree";
import Hash "mo:base/Hash";
// import Time "mo:base/Time";
import List "mo:base/List";

import Cons "constants";
import Types "types";
import Utils "utils";
import Comments "comments";

actor {
    type Comment = Types.Comment;
    type CommentHash = Hash.Hash;

    type CommentsHashHistory = Types.CommentsHashHistory;

    stable var commentsTotal = 0;

    private var commentsHashHistory : CommentsHashHistory = List.nil<CommentHash>();

    public query func totalComments() : async Nat { 
        
    };

    public shared ({caller = owner}) func postComment(text : Text) : async ?() {

    };

    public query func getComments(n : Nat) : async [Comment] {

    };

}