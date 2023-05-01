// ANCHOR: a
import Nat8 "mo:base/Nat8";

let x : Nat8 = 12; // Binary : 00001100
let p : Nat = 1;

Nat8.bitset(x, p) // Binary : 00001110
// ANCHOR_END: a
