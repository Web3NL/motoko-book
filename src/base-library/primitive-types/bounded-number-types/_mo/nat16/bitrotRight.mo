// ANCHOR: a
import Nat16 "mo:base/Nat16";

let x : Nat16 = 1; // Binary : 00000000_00000001
let y : Nat16 = 1;

Nat16.bitrotRight(x, y) // Binary : 10000000_00000000
// ANCHOR_END: a
