// Int8

// ANCHOR: a
import Int8 "mo:base/Int8";
// ANCHOR_END: a

// ANCHOR: b
let a : Int8 = -127;

let integer = Int8.toInt(a);

assert integer == -127;
// ANCHOR_END: b

// ANCHOR: c
let b : Int8 = -127;

let textualInt8 = Int8.toText(b);

assert textualInt8 == "-127";
// ANCHOR_END: c

