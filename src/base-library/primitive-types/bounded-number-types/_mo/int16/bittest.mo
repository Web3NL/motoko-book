// ANCHOR: a
import Int16 "mo:base/Int16";

let x : Int16 = 255; // Binary : 00000000_11111111
let p : Nat = 7;

Int16.bittest(x, p)
// ANCHOR_END: a
