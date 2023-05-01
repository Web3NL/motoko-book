// ANCHOR: a
import Int8 "mo:base/Int8";

let x : Int8 = 127; // Binary : 01111111
let y : Int8 = 15; // Binary : 00001111

Int8.bitand(x, y) 
// ANCHOR_END: a
