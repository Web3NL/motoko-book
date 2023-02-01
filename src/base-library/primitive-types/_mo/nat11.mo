// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a = 50;
let b = 20;

let subtraction = Nat.sub(a, b);

assert subtraction == 30;
// ANCHOR_END: a
