// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a : Nat = 50;
let b : Nat = 20;

let compare = Nat.compare(a, b);

assert compare == #greater;
// ANCHOR_END: a
