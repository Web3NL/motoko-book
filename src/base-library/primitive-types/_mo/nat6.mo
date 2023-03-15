// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a : Nat = 50;
let b : Nat = 20;

let isLess = Nat.less(a, b);
assert isLess == false;

let less = a < b;
assert less == false
// ANCHOR_END: a
