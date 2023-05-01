// ANCHOR: a
import Nat8 "mo:base/Nat8";

let x : Nat8 = 255; // Binary : 11111111
let y : Nat8 = 15; // Binary : 00001111

Nat8.bitand(x, y) // Binary : 00001111
// ANCHOR_END: a
