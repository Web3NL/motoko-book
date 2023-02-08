// Nat8

// ANCHOR: a
import Nat8 "mo:base/Nat8";
// ANCHOR_END: a

// ANCHOR: b
let a : Nat8 = 255;

let b : Nat = Nat8.toNat(a);

assert b == 255;
// ANCHOR_END: b

// ANCHOR: c
let textualNat8 = Nat8.toText(a);

assert textualNat8 == "255";
// ANCHOR_END: c

// ANCHOR: d
let nat8 = Nat8.fromNat(b);

assert nat8 == 255;
// ANCHOR_END: d

// ANCHOR: e
let integer : Int = 356 ;

let wrap = Nat8.fromIntWrap(integer);

assert wrap == 100 ;
// ANCHOR_END: e

