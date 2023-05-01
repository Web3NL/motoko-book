// ANCHOR: a
import Int16 "mo:base/Int16";

let x : Int16 = 15; // Binary : 00000000_00001111
let y : Int16 = 4;

Int16.bitshiftLeft(x, y) // Binary : 00000000_11110000
// ANCHOR_END: a
