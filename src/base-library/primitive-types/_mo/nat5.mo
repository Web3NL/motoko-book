// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a : Nat = 50;
let b : Nat = 20;

let isNotEqual = Nat.notEqual(a, b);
assert isNotEqual == true;

let notEqual = a != b;
assert notEqual == true;
// ANCHOR_END: a
