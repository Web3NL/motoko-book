// Int64

import Int64 "mo:base/Int64";

// ANCHOR: a
let nat64 : Nat64 = 9223372036854775807;

let int64 = Int64.fromNat64(nat64);

assert int64 == +9223372036854775807;
// ANCHOR_END: a
