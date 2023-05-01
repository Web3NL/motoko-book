// ANCHOR: a
import Nat16 "mo:base/Nat16";

let x : Nat16 = 15; // Binary : 00000000_00001111
let y : Nat16 = 4;

Nat16.bitshiftLeft(x, y) // Binary : 00000000_11110000
// ANCHOR_END: a
