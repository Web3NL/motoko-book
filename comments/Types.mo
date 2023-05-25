import HashMap "mo:base/HashMap";
import Hash "mo:base/Hash";
import List "mo:base/List";
import Result "mo:base/Result";

module {
    public type Comment = {
        created : Int;
        owner : Principal;
        comment : Text;
    };

    
    public type Id = Nat;
    public type Balance = Nat;
    public type LastPost = Int;

    public type Reward = Nat;
    public type CommentHash = Hash.Hash;

    public type Treasury = [var Nat];
    public type Users = HashMap.HashMap<Principal, (Id, Balance, LastPost)>;

    public type CommentStore = HashMap.HashMap<CommentHash, (Comment, Reward)>;
    public type CommentHistory = [var List.List<CommentHash>];

    public type Stores = (Treasury, Users, CommentStore, CommentHistory);

    public type PostError = {
        # InvalidComment;
        # TimeRemaining : Int;
        # AnonNotAllowed;
    };

    public type PostResult = Result.Result<(), PostError>;

    public type QueryComment = {
        created : Int;
        userId : Text;
        userBalance : Balance;
        comment : Text;
    };
};
