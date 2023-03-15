// Int32

import Int32 "mo:base/Int32";

// ANCHOR: a 
let int32 : Int32 = -21474;

let nat32 = Int32.toNat32(int32);

assert nat32 == 21474;
// ANCHOR_END: a
