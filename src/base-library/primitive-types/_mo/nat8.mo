// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a : Nat = 50;
let b : Nat = 20;

let isGreater = Nat.greater(a, b);
assert isGreater == true;

let greater = a > b;
assert greater == true;
// ANCHOR_END: a
