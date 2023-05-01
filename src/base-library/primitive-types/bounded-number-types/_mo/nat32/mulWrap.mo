// ANCHOR: a
import Nat32 "mo:base/Nat32";

let x : Nat32 = 65536; 
let y : Nat32 = 65536;

Nat32.mulWrap(x, y)     
// ANCHOR_END: a
