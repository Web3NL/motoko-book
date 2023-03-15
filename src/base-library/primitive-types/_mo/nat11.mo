// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a : Nat = 50;
let b : Nat = 20;

let subtract = Nat.sub(a, b);
assert subtract == 30; 

let subtraction = a - b; 
assert subtraction == 30;
// ANCHOR_END: a
