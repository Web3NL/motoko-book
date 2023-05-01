// ANCHOR: a
import Nat16 "mo:base/Nat16";

let x : Nat16 = 240; // Binary : 00000000_11110000
let y : Nat16 = 4;

Nat16.bitshiftRight(x, y) // Binary : 00000000_00001111
// ANCHOR_END: a
