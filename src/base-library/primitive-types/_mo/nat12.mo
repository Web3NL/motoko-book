// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a : Nat = 50;
let b : Nat = 20;

let multiply = Nat.mul(a, b);
assert multiply == 1000; 

let multiplication = a * b;
assert multiplication == 1000;
// ANCHOR_END: a
