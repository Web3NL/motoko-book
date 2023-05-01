// ANCHOR: a
import Int32 "mo:base/Int32";

let x : Int32 = 15; // Binary : 00000000_00000000_00000000_00001111
let y : Int32 = 4;

Int32.bitshiftLeft(x, y) // Binary : 00000000_00000000_00000000_11110000
// ANCHOR_END: a
