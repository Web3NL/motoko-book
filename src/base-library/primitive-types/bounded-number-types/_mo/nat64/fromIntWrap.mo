// ANCHOR: a
import Nat64 "mo:base/Nat64";

let integer : Int = 18_446_744_073_709_551_616;

Nat64.fromIntWrap(integer);
// ANCHOR_END: a
