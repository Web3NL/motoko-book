// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a : Nat = 50;
let b : Nat = 20;

let add = Nat.add(a, b);
assert add == 70; 

let addition = a + b;
assert addition == 70;
// ANCHOR_END: a
