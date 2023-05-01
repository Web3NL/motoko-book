// ANCHOR: a
import Nat32 "mo:base/Nat32";

let x : Nat32 = 127; // Binary : 00000000_00000000_00000000_01111111
let p : Nat = 7;

Nat32.bitset(x, p) // Binary : 00000000_00000000_00000000_11111111
// ANCHOR_END: a
