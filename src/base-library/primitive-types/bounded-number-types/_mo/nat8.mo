// Nat8

// ANCHOR: a
import Nat8 "mo:base/Nat8";
// ANCHOR_END: a

// ANCHOR: b
let a : Nat8 = 255;

let nat : Nat = Nat8.toNat(a);

assert nat == 255;
// ANCHOR_END: b

// ANCHOR: c
let b : Nat8 = 255;

let textualNat8 = Nat8.toText(b);

assert textualNat8 == "255";
// ANCHOR_END: c

// ANCHOR: d 
let c : Nat = 255;

let nat8 = Nat8.fromNat(c);

assert nat8 == 255;
// ANCHOR_END: d

// ANCHOR: e

let integer : Int = 356 ;

let wrap = Nat8.fromIntWrap(integer);

assert wrap == 100 ;
// ANCHOR_END: e

