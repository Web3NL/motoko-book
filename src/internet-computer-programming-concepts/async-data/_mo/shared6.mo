type GenderAge = {
    #Male : Nat;
    #Female : Nat;
};

// ANCHOR: a
type User = {
    id : Principal;
    genderAge : GenderAge;
};

type SharedFunction = shared User -> async User;
// ANCHOR_END: a
