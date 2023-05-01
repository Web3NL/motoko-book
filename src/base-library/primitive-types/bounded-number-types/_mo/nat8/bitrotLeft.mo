// ANCHOR: a
import Nat8 "mo:base/Nat8";

let x : Nat8 = 240; // Binary : 11110000
let y : Nat8 = 2;

Nat8.bitrotLeft(x, y) // Binary : 11000011
// ANCHOR_END: a
