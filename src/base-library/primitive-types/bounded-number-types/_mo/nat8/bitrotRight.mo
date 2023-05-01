// ANCHOR: a
import Nat8 "mo:base/Nat8";

let x : Nat8 = 15; // Binary : 00001111
let y : Nat8 = 2;

Nat8.bitrotRight(x, y) // Binary : 11000011
// ANCHOR_END: a
