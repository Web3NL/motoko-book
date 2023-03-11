// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a = 50;
let b = 50;

let remainder = Nat.rem(a, b);

assert remainder == 0; 

let remains = a % b;

assert remains == 0;
// ANCHOR_END: a
