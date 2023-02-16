// Int16

import Int16 "mo:base/Int16";

// ANCHOR: a 
let int16 : Int16 = -32768;

let nat16 = Int16.toNat16(int16);

assert nat16 == 32768;
// ANCHOR_END: a
