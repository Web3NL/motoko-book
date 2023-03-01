// Nat16

// ANCHOR: a
import Nat16 "mo:base/Nat16";
// ANCHOR_END: a

// ANCHOR: b
let a : Nat16 = 65535;

let nat = Nat16.toNat(a);

assert nat == 65535;
// ANCHOR_END: b

// ANCHOR: c
let b : Nat16 = 65535;

let textualNat16 = Nat16.toText(b);

assert textualNat16 == "65535";
// ANCHOR_END: c

// ANCHOR: d
let number : Nat = 65535;

let natToNat16 = Nat16.fromNat(number);

assert natToNat16 == 65535;
// ANCHOR_END: d

// ANCHOR: e
let integer = 65537;

let wrap = Nat16.fromIntWrap(integer);

assert wrap == 1;
// ANCHOR_END: e

