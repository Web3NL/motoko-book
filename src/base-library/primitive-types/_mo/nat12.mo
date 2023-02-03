// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a = 50;
let b = 20;

let multiply = Nat.mul(a, b);

assert multiply == 1000;
// ANCHOR_END: a
