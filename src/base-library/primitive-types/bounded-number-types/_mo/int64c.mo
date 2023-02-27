// Int64

import Int64 "mo:base/Int64";

// ANCHOR: a 
let int64 : Int64 = -92233;

let nat64 = Int64.toNat64(int64);

assert nat64 == 92233;
// ANCHOR_END: a
