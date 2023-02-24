// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a = 50;
let b = 20;

let compare = Nat.compare(a, b);

assert compare == #greater;
// ANCHOR_END: a
