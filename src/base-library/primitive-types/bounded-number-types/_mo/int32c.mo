// Int32

import Int32 "mo:base/Int32";

// ANCHOR: a 
let int32 : Int32 = -2147483647;

let nat32 = Int32.toNat32(int32);

assert nat32 == 2147483647;
// ANCHOR_END: a
