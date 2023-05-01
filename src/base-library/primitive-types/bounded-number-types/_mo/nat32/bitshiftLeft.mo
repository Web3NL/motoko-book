// ANCHOR: a
import Nat32 "mo:base/Nat32";

let x : Nat32 = 15; // Binary : 00000000_00000000_00000000_00001111
let y : Nat32 = 4;

Nat32.bitshiftLeft(x, y) // Binary : 00000000_00000000_00000000_11110000
// ANCHOR_END: a
