// Int32

import Int32 "mo:base/Int32";

// ANCHOR: a
let nat32 : Nat32 = 21474;

let int32 = Int32.fromNat32(nat32);

assert int32 == +21474;
// ANCHOR_END: a
