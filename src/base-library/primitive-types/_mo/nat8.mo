// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a = 50;
let b = 20;

let isGreater = Nat.greater(a, b);

assert isGreater == true;
// ANCHOR_END: a
