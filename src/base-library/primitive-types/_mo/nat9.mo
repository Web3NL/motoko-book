// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a = 50;
let b = 20;

let isGreaterOrEqual = Nat.greaterOrEqual(a, b);

assert isGreaterOrEqual == true; 

let greaterOrEqual = a >= b;

assert greaterOrEqual == true;
// ANCHOR_END: a
