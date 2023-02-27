// Nat

import Nat "mo:base/Nat";

// ANCHOR: a
let a = 50;
let b = 20;

let isLess = Nat.less(a, b);

assert isLess == false;

let less = a < b;

assert less == false
// ANCHOR_END: a
