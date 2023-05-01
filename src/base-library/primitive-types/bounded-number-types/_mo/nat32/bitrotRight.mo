// ANCHOR: a
import Nat32 "mo:base/Nat32";

let x : Nat32 = 255; // Binary : 00000000_00000000_00000000_11111111
let y : Nat32 = 8;

Nat32.bitrotRight(x, y) // Binary : 11111111_00000000_00000000_00000000
// ANCHOR_END: a
