// Int32

// ANCHOR: a
import Int32 "mo:base/Int32";
// ANCHOR_END: a

// ANCHOR: b
let a : Int32 = -2147483648;

let integer = Int32.toInt(a);

assert integer == -21474;
// ANCHOR_END: b

// ANCHOR: c
let b : Int32 = -2147483648;

let textualInt32 = Int32.toText(b);

assert textualInt32 == "-21474";
// ANCHOR_END: c

