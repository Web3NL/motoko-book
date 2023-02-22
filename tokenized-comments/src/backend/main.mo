// import Result "mo:base/Result";
// import Array "mo:base/Array";
import HashMap "mo:base/HashMap";
import Hash "mo:base/Hash";
// import Time "mo:base/Time";
import List "mo:base/List";
import Option "mo:base/Option";

import Cons "constants";
import Types "types";
import Utils "utils";
import Comments "comments";
import Memory "memory";

actor {
    type Comment = Types.Comment;
    type SharedComment = Types.SharedComment;
    type CommentHash = Types.CommentHash;

    type CommentHashHistory = Types.CommentHashHistory;

    stable var memHeight : Nat64 = Option.get(Memory.memHeight(), 0:Nat64);

    let comments = HashMap.HashMap<CommentHash, Comment>(10_000, Utils.commentEqual, func(h){h});

    private var commentHist : CommentHashHistory = List.nil<CommentHash>();

    public query func totalComments() : async Nat { 
        comments.size()
    };

    public shared ({caller = owner}) func postComment(text : Text) : async () {
        commentHist := Comments.putComment(owner, text, comments, commentHist)
    };

    public query func getComments(n : Nat) : async [SharedComment] {
        Comments.getComment(n, comments, commentHist)
    };

    // public func testMem() : async ?Nat64 {Memory.memHeight()};
    // public shared ({caller=id}) func testMem2() : async () {
    //     Memory.storeBalance(memHeight, (id, 0))
    // };

}