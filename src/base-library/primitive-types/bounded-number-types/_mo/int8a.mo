// Int8

import Int8 "mo:base/Int8";

// ANCHOR: a 
let integer = -127;

let int8 = Int8.fromInt(integer);

assert int8 == -127;
// ANCHOR_END: a
