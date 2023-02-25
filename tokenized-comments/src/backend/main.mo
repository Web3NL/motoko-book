// import Result "mo:base/Result";
// import Array "mo:base/Array";
import HashMap "mo:base/HashMap";
import Hash "mo:base/Hash";
// import Time "mo:base/Time";
import List "mo:base/List";
import Option "mo:base/Option";
import Text "mo:base/Text";
import Blob "mo:base/Blob";

// import Constants "constants";
import Types "types";
import Utils "utils";
import Comments "comments";
// import Memory "memory";

actor {
    type Comment = Types.Comment;
    type SharedComment = Types.SharedComment;
    type CommentHash = Types.CommentHash;
    type CommentMap = Types.CommentMap;
    type CommentHashHistory = Types.CommentHashHistory;

    let comments : CommentMap = HashMap.HashMap<CommentHash, Comment>(10_000, Utils.commentEqual, func(h){h});

    private var commentHist : CommentHashHistory = List.nil<CommentHash>();

    public query func totalComments() : async Nat { 
        comments.size()
    };

    public shared ({caller = owner}) func postComment(text : Text) : async CommentHash {
        let (hash, hist) = Comments.putComment(owner, text, comments, commentHist);
        commentHist := hist;
        hash
    };

    public query func getComments(n : Nat) : async [SharedComment] {
        Comments.getComment(n, comments, commentHist)
    };

    public func like(h : CommentHash) : async () {
        Comments.like(h, comments)
    };

    // public shared query ({caller}) func memHeight_() : async ?Nat64 {
    //     Memory.memHeight() 
    // };

    // public shared ({caller}) func testMem2() : async () {
    //     Memory.storeBalance(memHeight, (caller, 0))
    // };

}