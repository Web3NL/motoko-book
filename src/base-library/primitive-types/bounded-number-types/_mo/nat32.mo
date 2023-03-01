// Nat32

// ANCHOR: a
import Nat32 "mo:base/Nat32";
// ANCHOR_END: a

// ANCHOR: b   
let a : Nat32 = 4294967295;

let nat = Nat32.toNat(a);

assert nat == 4294967295;
// ANCHOR_END: b

// ANCHOR: c
let b : Nat32 = 4294967295;

let textualNat32 = Nat32.toText(b);

assert textualNat32 == "4294967295";
// ANCHOR_END: c

// ANCHOR: d
let number = 4294967295;

let natToNat32 = Nat32.fromNat(number);

assert natToNat32 == 4294967295;
// ANCHOR_END: d

// ANCHOR: e
let integer = 4294967297;

let wrap = Nat32.fromIntWrap(integer);

assert wrap == 1;
// ANCHOR_END: e

