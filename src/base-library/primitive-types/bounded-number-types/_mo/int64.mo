// Int64

// ANCHOR: a
import Int64 "mo:base/Int64";
// ANCHOR_END: a

// ANCHOR: b
let a : Int64 = -92233;

let integer = Int64.toInt(a);

assert integer == -92233;
// ANCHOR_END: b

// ANCHOR: c
let b : Int64 = -92233;

let textualInt64 = Int64.toText(b);

assert textualInt64 == "-92233";
// ANCHOR_END: c

