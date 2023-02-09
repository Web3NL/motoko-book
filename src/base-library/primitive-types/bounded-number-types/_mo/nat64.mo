// Nat64

// ANCHOR: a
import Nat64 "mo:base/Nat64";
// ANCHOR_END: a

// ANCHOR: b   
let a : Nat64 = 18446744073709551615;

let nat = Nat64.toNat(a);

assert nat == 18446744073709551615;
// ANCHOR_END: b

// ANCHOR: c
let textualNat64 = Nat64.toText(a);

assert textualNat64 == "18446744073709551615";
// ANCHOR_END: c

// ANCHOR: d
let number = 18446744073709551615;

let natToNat64 = Nat64.fromNat(number);

assert natToNat64 == 18446744073709551615;
// ANCHOR_END: d

// ANCHOR: f
let integer = 18446744073709551617;

let wrap = Nat64.fromIntWrap(integer);

assert wrap == 1;
// ANCHOR_END: f

