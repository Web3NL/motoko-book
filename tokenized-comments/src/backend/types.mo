import List "mo:base/List";
import Hash "mo:base/Hash";
import Time "mo:base/Time";

module {
    public type CommentHash = Hash.Hash;

    public type Comment = {
        created : Time.Time;
        owner : Principal;
        text : Text;
    };

    public type CommentHistory = List.List<CommentHash>;

    public type Like = {
        id : CommentHash;
        created : Time.Time;
        liker : Principal;
    };

    public type Report = {
        id : CommentHash;
        created : Time.Time;
        reporter : Principal;
    };


}