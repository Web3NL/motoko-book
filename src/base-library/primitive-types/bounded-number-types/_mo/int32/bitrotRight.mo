// ANCHOR: a
import Int32 "mo:base/Int32";

let x : Int32 = 2_147_483_647; // Binary : 01111111_11111111_11111111_11111111
let y : Int32 = 1;

Int32.bitrotRight(x ,y) // Binary : 10111111_11111111_11111111_11111111
// ANCHOR_END: a
