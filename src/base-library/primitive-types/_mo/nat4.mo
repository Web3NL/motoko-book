// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a = 50;
let b = 20;

let isEqual = Nat.equal(a, b);

assert isEqual == false;
// ANCHOR_END: a
