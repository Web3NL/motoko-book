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

import M "mo:MotokoStableBTree";

actor {
    type Comment = Types.Comment;
    type CommentHash = Hash.Hash;

    private let commentsTree : Types.CommentsTree = RB.RBTree<CommentHash, Comment>(Utils.commentHashCompare);
    private var commentsHashHistory : Types.CommentsHashHistory = List.nil<CommentHash>();

    public query func totalComments() : async Nat { 
        Comments.totalComments(commentsTree)
    };

    public shared ({caller = owner}) func postComment(text : Text) : async ?() {
        let result = Comments.postComment(owner, text, commentsHashHistory, commentsTree);
        switch (result) {
            case null return null;
            case (?list) {
                commentsHashHistory := list;
                return ?()
            };
        };
    };

    public query func getComments(n : Nat) : async [Comment] {
        Comments.getComments(n, commentsHashHistory, commentsTree)
    };

}