// ANCHOR: a
import Nat32 "mo:base/Nat32";

let x : Nat32 = 255; // Binary : 00000000_00000000_00000000_11111111
let p : Nat = 7;

Nat32.bittest(x, p)
// ANCHOR_END: a
