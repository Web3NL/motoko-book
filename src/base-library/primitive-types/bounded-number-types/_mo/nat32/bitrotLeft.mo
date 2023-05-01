// ANCHOR: a
import Nat32 "mo:base/Nat32";

let x : Nat32 = 4_278_190_080; // Binary : 11111111_00000000_00000000_00000000
let y : Nat32 = 8;

Nat32.bitrotLeft(x, y) // Binary : 00000000_00000000_00000000_11111111
// ANCHOR_END: a
