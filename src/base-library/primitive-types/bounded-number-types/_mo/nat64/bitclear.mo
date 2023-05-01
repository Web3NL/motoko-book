// ANCHOR: a
import Nat64 "mo:base/Nat64";

let x : Nat64 = 255;       
let p : Nat = 7;

Nat64.bitclear(x, p)      
// ANCHOR_END: a
