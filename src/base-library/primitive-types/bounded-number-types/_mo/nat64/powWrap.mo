// ANCHOR: a
import Nat64 "mo:base/Nat64";

let x : Nat64 = 4294967296; 
let y : Nat64 = 2;

Nat64.powWrap(x, y)      
// ANCHOR_END: a
