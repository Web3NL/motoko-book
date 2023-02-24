// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a = 50;
let b = 50;

let division = Nat.div(a, b);

assert division == 1;
// ANCHOR_END: a
