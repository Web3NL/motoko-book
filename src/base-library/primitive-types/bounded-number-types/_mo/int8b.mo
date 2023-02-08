// Int

import Int8 "mo:base/Int8";

// ANCHOR: 
let nat8 : Nat8 = 127;

let int8 = Int8.fromNat8(nat8);

assert int8 == -127;
// ANCHOR_END: a
