// Nat

// ANCHOR: a
import Nat "mo:base/Nat";
// ANCHOR_END: a

// ANCHOR: b
let natural_number = 10;
// ANCHOR_END: b

// ANCHOR: c
let Nat_to_text = Nat.toText(natural_number);

assert Nat_to_text == "10";
// ANCHOR_END: c

// ANCHOR: d
let a = 50;
let b = 20;

let minimum = Nat.min(a, b);

assert minimum == 20;
// ANCHOR_END: d

// ANCHOR: e
let maximum = Nat.max(a, b);

assert maximum == 50;
// ANCHOR_END: e

// ANCHOR: f
let compare = Nat.compare(a, b);

assert compare == #greater;
// ANCHOR_END: f
