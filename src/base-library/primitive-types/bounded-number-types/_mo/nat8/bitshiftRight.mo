// ANCHOR: a
import Nat8 "mo:base/Nat8";

let x : Nat8 = 12; // Binary : 00001100
let y : Nat8 = 2;

Nat8.bitshiftRight(x, y) // Binary : 00000011
// ANCHOR_END: a
