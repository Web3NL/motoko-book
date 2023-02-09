// Int32

// ANCHOR: a
import Int32 "mo:base/Int32";
// ANCHOR_END: a

// ANCHOR: b
let a : Int32 = -2147483648;

let integer = Int32.toInt(a);

assert integer == -2147483648;
// ANCHOR_END: b

// ANCHOR: c
let textualInt32 = Int32.toText(a);

assert textualInt32 == "-2147483648";
// ANCHOR_END: c

