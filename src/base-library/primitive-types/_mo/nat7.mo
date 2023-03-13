// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a : Nat = 50;
let b : Nat = 50;

let isLessOrEqual = Nat.lessOrEqual(a, b);
assert isLessOrEqual == true;

let lessOrEqual = a <= b;
assert lessOrEqual == true;
// ANCHOR_END: a
