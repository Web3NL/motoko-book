// ANCHOR: a
import Int8 "mo:base/Int8";

let x : Int8 = 15; // Binary : 00001111
let y : Int8 = 14; // Binary : 00001110

Int8.bitxor(x, y) // Binary : 00000001
// ANCHOR_END: a
