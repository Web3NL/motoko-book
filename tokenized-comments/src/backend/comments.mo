import RB "mo:base/RBTree";
import Hash "mo:base/Hash";
import Time "mo:base/Time";
import List "mo:base/List";

import Types "types";
import Utils "utils";

module {
    type Comment = Types.Comment;
    type SharedComment = Types.SharedComment;
    type CommentMap = Types.CommentMap;
    type CommentHashHistory = Types.CommentHashHistory;
    type CommentHash = Types.CommentHash;

    type Like = Types.Like;
    type Report = Types.Report;

    public func putComment(owner : Principal, text : Text, hm : CommentMap, hist : CommentHashHistory) : CommentHashHistory {
        let comment : Comment = {
            created = Time.now();
            owner;
            text;
            var likes = 0;
            var reports = 0;
            var likers = List.nil<Like>();
            var reporters = List.nil<Report>();
        };
       
        let hash = Utils.commentHash(comment);

        hm.put(hash, comment);
        List.push(hash, hist)
    };

    public func getComment(n : Nat, hm : CommentMap, hist : CommentHashHistory) : [SharedComment] {
        let commentHashes = List.take(hist, n);

        func sharedComment(h : CommentHash) : ?SharedComment {
            switch (hm.get(h)) {
                case null return null;
                case (?c) {
                    ?{
                        created = c.created;
                        owner = c.owner;
                        text = c.text;
                        likes = c.likes;
                        reports = c.reports;
                    } : ?SharedComment
                }
            };
        };

        let comments = List.mapFilter<CommentHash, SharedComment>(commentHashes, sharedComment);
        
        List.toArray(comments)
    };

}