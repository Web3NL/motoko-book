// INT

// ANCHOR: a
import Int "mo:base/Int";
// ANCHOR_END: a

// ANCHOR: b
let integer = -10;

let absoluteValue = Int.abs(integer);
// ANCHOR_END: b

// ANCHOR: c
let intToText = Int.toText(integer);

assert intToText == "-10";
// ANCHOR_END: c

// ANCHOR: d
let a = 20;
let b = -20;

let minimum = Int.min(a, b);

assert minimum == -20;
// ANCHOR_END: d

