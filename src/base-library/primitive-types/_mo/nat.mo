// Nat

// ANCHOR: a
import Nat "mo:base/Nat";
// ANCHOR_END: a

// ANCHOR: b
let natural = 10;

let textualNat = Nat.toText(natural);

assert textualNat == "10";
// ANCHOR_END: b

// ANCHOR: c

// ANCHOR_END: c

// ANCHOR: d
let a = 50;
let b = 20;

let minimum = Nat.min(a, b);

assert minimum == 20;
// ANCHOR_END: d
