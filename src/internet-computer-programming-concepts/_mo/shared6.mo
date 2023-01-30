// SHARED TYPES

actor {

// ANCHOR: a
type User = { 
    id : Principal;
    balance : Nat;
};

type SharedFunction = shared User -> async User;
// ANCHOR_END: a

}
