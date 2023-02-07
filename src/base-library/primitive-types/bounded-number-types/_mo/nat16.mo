// Nat16

// ANCHOR: a
import Nat16 "mo:base/Nat16";
// ANCHOR_END: a

// ANCHOR: b
let a : Nat16 = 32767;

let b : Nat = Nat16.toNat(a);

assert b == 32767;
// ANCHOR_END: b

// ANCHOR: c
let textualNat16 = Nat16.toText(a);

assert textualNat16 == "32767";
// ANCHOR_END: c

// ANCHOR: d
let natToNat16 = Nat16.fromNat(b);

assert natToNat16 == 32767;
// ANCHOR_END: d

// ANCHOR: f
let integer : Int = 32768 ;

let wrap = Nat16.fromIntWrap(integer);

assert wrap == 1;
// ANCHOR_END: f

