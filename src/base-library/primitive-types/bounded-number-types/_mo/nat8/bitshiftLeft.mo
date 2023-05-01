// ANCHOR: a
import Nat8 "mo:base/Nat8";

let x : Nat8 = 48; // Binary : 00110000
let y : Nat8 = 2;

Nat8.bitshiftLeft(x, y) // Binary : 11000000
// ANCHOR_END: a
