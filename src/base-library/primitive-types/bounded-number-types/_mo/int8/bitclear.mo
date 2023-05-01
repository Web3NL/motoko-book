// ANCHOR: a
import Int8 "mo:base/Int8";

let x : Int8 = 12; // Binary : 00001100
let p : Nat = 3;

Int8.bitclear(x, p) // Binary : 00000100
// ANCHOR_END: a
