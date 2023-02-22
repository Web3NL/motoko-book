import List "mo:base/List";
import Hash "mo:base/Hash";
import Time "mo:base/Time";
import HashMap "mo:base/HashMap";

module {
    public type CommentHash = Hash.Hash;

    public type Like = (Nat64, Principal);
    public type Report = (Nat64, Principal);

    public type Comment = {
        created : Time.Time;
        owner : Principal;
        text : Text;
        var likes : Nat;
        var reports : Nat;
        var likers : List.List<Like>;
        var reporters : List.List<Report>;
    };

    public type SharedComment = {
        created : Time.Time;
        owner : Principal;
        text : Text;
        likes : Nat;
        reports : Nat;
    };

    public type CommentMap = HashMap.HashMap<CommentHash, Comment>;

    public type CommentHashHistory = List.List<CommentHash>;
}