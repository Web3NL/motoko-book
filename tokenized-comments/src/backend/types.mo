import List "mo:base/List";
import Hash "mo:base/Hash";
import Time "mo:base/Time";
import RB "mo:base/RBTree";

module {
    public type Time = Time.Time;

    public type CommentHash = Hash.Hash;

    public type Comment = {
        created : Time.Time;
        owner : Principal;
        text : Text;
        likes : Nat;
        Reports : Nat;
        likers : List.List<(Time, Principal)>;
        reporters : List.List<(Time, Principal)>;
    };

    public type CommentsHashHistory = List.List<CommentHash>;
}