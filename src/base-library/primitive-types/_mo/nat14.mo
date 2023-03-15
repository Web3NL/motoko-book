// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a : Nat = 50;
let b : Nat = 50;

let remainder = Nat.rem(a, b);
assert remainder == 0; 

let remains = a % b;
assert remains == 0;
// ANCHOR_END: a
