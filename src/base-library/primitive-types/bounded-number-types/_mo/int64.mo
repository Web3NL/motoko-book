// Int64

// ANCHOR: a
import Int64 "mo:base/Int64";
// ANCHOR_END: a

// ANCHOR: b
let a : Int64 = -9223372036854775808;

let integer = Int64.toInt(a);

assert integer == -9223372036854775808;
// ANCHOR_END: b

// ANCHOR: c
let textualInt64 = Int64.toText(a);

assert textualInt64 == "-9223372036854775808";
// ANCHOR_END: c

