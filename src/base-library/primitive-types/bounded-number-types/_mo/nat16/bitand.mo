// ANCHOR: a
import Nat16 "mo:base/Nat16";

let x : Nat16 = 65530; // Binary : 11111111_11111111
let y : Nat16 = 5; // Binary : 00000000_00000101

Nat16.bitand(x, y) // Binary : 00000000_00000101
// ANCHOR_END: a
