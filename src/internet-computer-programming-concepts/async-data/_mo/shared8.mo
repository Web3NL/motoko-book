// ANCHOR: a
type Account = actor {
    checkBalance : shared () -> async Nat;
};

type SharedFunction = shared Account -> async Account;
// ANCHOR_END: a
