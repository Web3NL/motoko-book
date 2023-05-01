// ANCHOR: a
import Int16 "mo:base/Int16";

let x : Int16 = 255; // Binary : 00000000_11111111
let y : Int16 = 5; // Binary : 00000000_00000101

Int16.bitand(x, y) 
// ANCHOR_END: a
