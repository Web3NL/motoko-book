// Nat64

// ANCHOR: a
import Nat64 "mo:base/Nat64";
// ANCHOR_END: a

// ANCHOR: b   
let a : Nat64 = 184467;

let nat = Nat64.toNat(a);

assert nat == 184467;
// ANCHOR_END: b

// ANCHOR: c
let b : Nat64 = 184467;

let textualNat64 = Nat64.toText(b);

assert textualNat64 == "184467";
// ANCHOR_END: c

// ANCHOR: d
let number = 184467;

let natToNat64 = Nat64.fromNat(number);

assert natToNat64 == 184467;
// ANCHOR_END: d

// ANCHOR: f
let integer = 1;

let wrap = Nat64.fromIntWrap(integer);

assert wrap == 1;
// ANCHOR_END: f

