import Iter "mo:base/Iter";

// ANCHOR: a
let myRange = Iter.range(1, 3);

func change(n : Nat) : Int {
    n * -1;
};

let mapedIter = Iter.map<Nat, Int>(myRange, change);

let array = Iter.toArray(mapedIter);

// [-1, -2, -3]
// ANCHOR_END: a
