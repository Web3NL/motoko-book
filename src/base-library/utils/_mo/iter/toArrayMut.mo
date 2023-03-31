import Iter "mo:base/Iter";

// ANCHOR: a

let myRange = Iter.range(1, 3);

let arrayMut = Iter.toArrayMut<Nat>(myRange);

// [ var 1, 2, 3] : [var Nat]
// ANCHOR_END: a
