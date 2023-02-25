import List "mo:base/List";
import Hash "mo:base/Hash";
import Time "mo:base/Time";
import HashMap "mo:base/HashMap";

module {
    public type Comment = {
        created : Time.Time;
        owner : Principal;
        text : Text;
    };

    public type CommentHash = Hash.Hash;

    public type CommentMap = HashMap.HashMap<CommentHash, Comment>;
    public type CommentHashHistory = List.List<CommentHash>;

    public type Likes = HashMap.HashMap<CommentHash, Nat>;
    public type Reports = HashMap.HashMap<CommentHash, Nat>;

    public type Likers = HashMap.HashMap<CommentHash, List.List<Principal>>;
    public type Reporters = HashMap.HashMap<CommentHash, List.List<Principal>>;

    public type LikeHash = Hash.Hash;
    public type ReportHash = Hash.Hash;

    public type Liked = HashMap.HashMap<LikeHash, Bool>;
    public type Reported = HashMap.HashMap<ReportHash, Bool>;

    public type Balances = HashMap.HashMap<Principal, Nat>;
}