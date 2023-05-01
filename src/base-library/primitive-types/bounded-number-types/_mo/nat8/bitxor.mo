// ANCHOR: a
import Nat8 "mo:base/Nat8";

let x : Nat8 = 15; // Binary : 00001111
let y : Nat8 = 3; // Binary : 00000011

Nat8.bitxor(x, y) // Binary : 00001100
// ANCHOR_END: a
