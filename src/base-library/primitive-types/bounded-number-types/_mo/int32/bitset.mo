// ANCHOR: a
import Int32 "mo:base/Int32";

let x : Int32 = 127; // Binary : 00000000_00000000_00000000_01111111
let p : Nat = 7;

Int32.bitset(x, p) // Binary : 00000000_00000000_00000000_11111111
// ANCHOR_END: a
