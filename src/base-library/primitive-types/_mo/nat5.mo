// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a = 50;
let b = 20;

let isNotEqual = Nat.notEqual(a, b);

assert isNotEqual == true;

let notEqual = a != b;

assert notEqual == true;
// ANCHOR_END: a
