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

    public func putComment(owner : Principal, text : Text, hm : CommentMap, hist : CommentHashHistory) : (CommentHash, CommentHashHistory) {
        let comment : Comment = {
            created = Time.now();
            owner;
            text;
            likes = 0;
            reports = 0;
            likers = List.nil<Like>();
            reporters = List.nil<Report>();
        };
       
        let hash = Utils.commentHash(comment);

        hm.put(hash, comment);
        (hash, List.push(hash, hist))
    };

    public func getComment(n : Nat, hm : CommentMap, hist : CommentHashHistory) : [SharedComment] {
        let commentHashes = List.take(hist, n);

        func sharedComment(hash : CommentHash) : ?SharedComment {
            switch (hm.get(hash)) {
                case null return null;
                case (?c) {
                    ?{
                        hash;
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

    public func like(h : CommentHash, hm : CommentMap) {
        switch(hm.get(h)) {
            case null assert false;
            case (?comment) {
                let new = {
                    created = comment.created;
                    owner = comment.owner;
                    text = comment.text;
                    likes = comment.likes + 1;
                    reports = comment.reports;
                    likers = comment.likers;
                    reporters = comment.reporters;
                };
                hm.put(h, new)
            };
        };
    };

}