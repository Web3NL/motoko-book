import Iter "mo:base/Iter";

// ANCHOR: a

let myRange = Iter.range(1, 3);

let array = Iter.toArray<Nat>(myRange);

// [1, 2, 3] : [Nat]
// ANCHOR_END: a
