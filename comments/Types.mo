import HashMap "mo:base/HashMap";

module {
    public type Comment = {
        created : Int;
        owner : Principal;
        comment : Text;
    };

    public type UserIds = HashMap.HashMap<Principal, Nat>;
    public type Balances = HashMap.HashMap<Principal, Nat>;

    public type Reward = Nat;
    public type CommentStore = HashMap.HashMap<Int, (Comment, Reward)>;
};
