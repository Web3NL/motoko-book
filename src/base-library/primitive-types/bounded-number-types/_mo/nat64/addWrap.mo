// ANCHOR: a
import Nat64 "mo:base/Nat64";

let x : Nat64 = 18_446_744_073_709_551_615; 
let y : Nat64 = 1;

Nat64.addWrap(x, y)     
// ANCHOR_END: a
