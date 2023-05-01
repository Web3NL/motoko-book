// ANCHOR: a
import Nat16 "mo:base/Nat16";

let x : Nat16 = 32768; // Binary : 10000000_00000000
let y : Nat16 = 1;

Nat16.bitrotLeft(x, y) // Binary : 00000000_00000001
// ANCHOR_END: a
