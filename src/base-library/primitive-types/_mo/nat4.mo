// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a : Nat = 50;
let b : Nat = 20;

let isEqual = Nat.equal(a, b);
assert isEqual == false;

let isEqualAgain = a == b;
assert isEqualAgain == false;
// ANCHOR_END: a
