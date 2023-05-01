// ANCHOR: a
import Int16 "mo:base/Int16";

let x : Int16 = 255; // Binary : 00000000_11111111
let y : Int16 = 240; // Binary : 00000000_11110000

Int16.bitxor(x, y) // Binary : 00000000_00001111
// ANCHOR_END: a
