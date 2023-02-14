import Result "mo:base/Result";
import Array "mo:base/Array";
import RB "mo:base/RBTree";
import Hash "mo:base/Hash";
import Time "mo:base/Time";

import Cons "constants";
import Types "types";
import Utils "utils";

actor {
    type Comment = Types.Comment;
    type CommentHash = Hash.Hash;

    private let comments = RB.RBTree<CommentHash, Comment>(Utils.commentHashCompare);

    private func putComment(owner : Principal, text : Text) {
        let created = Time.now();

        let comment = {
            created;
            owner;
            text;
        };

        let hash = Utils.hashComment(comment);

        comments.put(hash, comment)
    };

}