// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a = 50;
let b = 20;

let isLessOrEqual = Nat.lessOrEqual(a, b);

assert isLessOrEqual == false;
// ANCHOR_END: a
