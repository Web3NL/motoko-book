// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a : Nat = 50;
let b : Nat = 20;

let isGreaterOrEqual = Nat.greaterOrEqual(a, b);
assert isGreaterOrEqual == true; 

let greaterOrEqual = a >= b;
assert greaterOrEqual == true;
// ANCHOR_END: a
