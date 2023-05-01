// ANCHOR: a
import Nat16 "mo:base/Nat16";

let x : Nat16 = 255; // Binary : 00000000_11111111
let p : Nat = 7;

Nat16.bitclear(x, p) // Binary : 00000000_01111111
// ANCHOR_END: a
