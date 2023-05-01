// ANCHOR: a
import Int8 "mo:base/Int8";

let x : Int8 = 15; // Binary : 00001111
let y : Int8 = 4;

Int8.bitshiftLeft(x, y) // Binary : 11110000
// ANCHOR_END: a
