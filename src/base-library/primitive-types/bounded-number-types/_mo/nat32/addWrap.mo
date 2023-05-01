// ANCHOR: a
import Nat32 "mo:base/Nat32";

let x : Nat32 = 4294967295; 
let y : Nat32 = 1;

Nat32.addWrap(x, y)     
// ANCHOR_END: a
