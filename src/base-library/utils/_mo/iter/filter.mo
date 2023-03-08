import Iter "mo:base/Iter";

// ANCHOR: a
let myRange = Iter.range(1, 3);

func change(n : Nat) : Bool {
    n  > 1
};

let filterIter = Iter.filter<Nat>(myRange, change);

let itertoArray = Iter.toArray(filterIter);

// [ 2, 3] 
// ANCHOR_END: a
