// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a = 50;
let b = 50;

let isLessOrEqual = Nat.lessOrEqual(a, b);

assert isLessOrEqual == true;
// ANCHOR_END: a
