// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a = 50;
let b = 20;

let maximum = Nat.max(a, b);

assert maximum == 50;
// ANCHOR_END: a

