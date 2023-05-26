import HashMap "mo:base/HashMap";
import Hash "mo:base/Hash";
import List "mo:base/List";
import Result "mo:base/Result";

module {
    // Coment data
    public type Comment = {
        created : Int;
        owner : Principal;
        comment : Text;
    };
    public type Reward = Nat;
    public type CommentHash = Hash.Hash;

    // User data
    public type Id = Nat;
    public type Balance = Nat;
    public type LastPost = Int;

    // Stores
    public type Treasury = [var Nat];
    public type Users = HashMap.HashMap<Principal, (Id, Balance, LastPost)>;
    public type CommentStore = HashMap.HashMap<CommentHash, (Comment, Reward)>;
    public type CommentHistory = [var List.List<CommentHash>];

    public type Stores = (Treasury, Users, CommentStore, CommentHistory);

    // Results
    public type PostResult = Result.Result<(), PostError>;
    type PostError = {
        # InvalidComment;
        # TimeRemaining : Int;
        # AnonNotAllowed;
    };

    // Queries
    public type QueryComment = {
        created : Int;
        userId : Text;
        userBalance : Balance;
        comment : Text;
    };
};
