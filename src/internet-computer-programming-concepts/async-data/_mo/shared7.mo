// SHARED TYPES

actor {

    // ANCHOR: a
    type CheckBalance = shared () -> async Nat;

    type SharedFunction = shared CheckBalance -> async CheckBalance;
    // ANCHOR_END: a

};
