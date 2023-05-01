// ANCHOR: a
import Int16 "mo:base/Int16";

let x : Int16 = 127; // Binary : 00000000_01111111
let p : Nat = 7;

Int16.bitset(x, p) // Binary : 00000000_11111111
// ANCHOR_END: a
