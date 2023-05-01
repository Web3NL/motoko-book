// ANCHOR: a
import Int16 "mo:base/Int16";

let x : Int16 = 32767; // Binary : 01111111_11111111
let y : Int16 = 1;

Int16.bitrotLeft(x, y) // Binary : 11111111_11111110
// ANCHOR_END: a
