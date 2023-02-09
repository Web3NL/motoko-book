// Int64

import Int64 "mo:base/Int64";

// ANCHOR: 
let integer = -9223372036854775808;

let int64 = Int64.fromInt(integer);

assert int64 == -9223372036854775808;
// ANCHOR_END: a
