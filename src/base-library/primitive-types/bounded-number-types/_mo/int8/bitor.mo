// ANCHOR: a
import Int8 "mo:base/Int8";

let x : Int8 = 112; // Binary : 01110000
let y : Int8 = 15; // Binary : 00001111

Int8.bitor(x, y) // Binary : 01111111
// ANCHOR_END: a
