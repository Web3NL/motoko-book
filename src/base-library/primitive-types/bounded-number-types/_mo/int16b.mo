// Int16

import Int16 "mo:base/Int16";

// ANCHOR: a 
let nat16 : Nat16 = 32767;

let int16 = Int16.fromNat16(nat16);

assert int16 == +32767;
// ANCHOR_END: a
