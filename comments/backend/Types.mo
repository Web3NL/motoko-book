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
        reward : Nat;
    };
    public type CommentHash = Hash.Hash;

    // User data
    public type User = {
        id : Nat;
        balance : Nat;
        lastLike : Int;
        lastPost : Int;
        likes : List.List<CommentHash>;
    };

    // Stores
    public type Treasury = [var Nat];
    public type Users = HashMap.HashMap<Principal, User>;
    public type CommentStore = HashMap.HashMap<CommentHash, Comment>;
    public type CommentHistory = [var List.List<CommentHash>];

    public type Stores = (Treasury, Users, CommentStore, CommentHistory);

    // Results
    type Error = {
        # TimeRemaining : Int;
        # AnonNotAllowed;
        # UserNotFound;
    };

    public type PostResult = Result.Result<(), PostError>;
    type PostError = Error or { # InvalidComment };

    public type LikeResult = Result.Result<Nat, LikeError>;
    type LikeError = Error or { # AlreadyLiked };

    // Queries
    public type QueryComment = {
        created : Int;
        userId : Text;
        comment : Text;
        reward : Nat;
        hash : CommentHash;
    };

    public type QueryUser = {
        id : Nat;
        balance : Nat;
        lastLike : Int;
        lastPost : Int;
        likes : [CommentHash];
    };
};
