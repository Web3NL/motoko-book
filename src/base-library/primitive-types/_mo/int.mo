// INT

// ANCHOR: a
import Int "mo:base/Int";
// ANCHOR_END: a

// ANCHOR: b
let integer : Int = -10;

let absoluteValue : Nat = Int.abs(integer);

assert absoluteValue == 10;
// ANCHOR_END: b

// ANCHOR: d
let a : Int = 20;
let b : Int = -20;

let minimum = Int.min(a, b);

assert minimum == -20;
// ANCHOR_END: d

