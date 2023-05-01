// ANCHOR: a
import Nat8 "mo:base/Nat8";

let x : Nat8 = 12; // Binary : 00001100
let p : Nat = 4;

Nat8.bitflip(x, p) // Binary : 00011100
// ANCHOR_END: a
