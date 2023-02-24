// Int16

// ANCHOR: a
import Int16 "mo:base/Int16";
// ANCHOR_END: a

// ANCHOR: b
let a : Int16 = -32768;

let integer = Int16.toInt(a);

assert integer == -32768;
// ANCHOR_END: b

// ANCHOR: c
let textualInt16 = Int16.toText(a);

assert textualInt16 == "-32768";
// ANCHOR_END: c

