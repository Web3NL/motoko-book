// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a = 50;
let b = 20;

let add = Nat.add(a, b);

assert add == 70;
// ANCHOR_END: a
