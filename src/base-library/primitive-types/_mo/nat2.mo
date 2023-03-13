// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a : Nat = 50;
let b : Nat = 20;

let maximum = Nat.max(a, b);

assert maximum == 50;
// ANCHOR_END: a

