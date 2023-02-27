// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a = 50;
let b = 20;

let subtract = Nat.sub(a, b);

assert subtract == 30; 

let subtraction = a - b; 

assert subtraction == 30;
// ANCHOR_END: a
