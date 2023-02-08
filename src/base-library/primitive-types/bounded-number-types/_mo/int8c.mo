// Int

import Int8 "mo:base/Int8";

// ANCHOR: 
let int8 : Int8 = 127;

let nat8 = Int8.toNat8(int8);

assert nat8 == 127;
// ANCHOR_END: a
