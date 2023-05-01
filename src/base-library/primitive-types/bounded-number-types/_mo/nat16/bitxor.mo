// ANCHOR: a
import Nat16 "mo:base/Nat16";

let x : Nat16 = 255; // Binary : 00000000_11111111
let y : Nat16 = 240; // Binary : 00000000_11110000

Nat16.bitxor(x, y) // Binary : 00000000_00001111
// ANCHOR_END: a
