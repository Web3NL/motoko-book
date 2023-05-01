// ANCHOR: a
import Nat8 "mo:base/Nat8";

let x : Nat8 = 12; // Binary : 00001100
let p : Nat = 3;

Nat8.bitclear(x, p) // Binary : 00000100
// ANCHOR_END: a
