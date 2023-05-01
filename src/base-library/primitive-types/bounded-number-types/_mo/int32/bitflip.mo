// ANCHOR: a
import Int32 "mo:base/Int32";

let x : Int32 = 255; // Binary : 00000000_00000000_00000000_11111111
let p : Nat = 7;

Int32.bitflip(x, p) // Binary : 00000000_00000000_00000000_01111111
// ANCHOR_END: a
