// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a : Nat = 5;
let b : Nat = 5;

let power = Nat.pow(a, b);
assert power == 25; 

let pow = a ** b;
assert pow == 25;
// ANCHOR_END: a
