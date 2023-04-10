// ANCHOR: a
type GenderAge = {
    #Male : Nat;
    #Female : Nat;
};

type SharedFunction = shared GenderAge -> async GenderAge;
// ANCHOR_END: a
