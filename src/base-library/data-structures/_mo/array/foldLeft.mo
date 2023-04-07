// ANCHOR: a
import Array "mo:base/Array";

let array = [40, 20, 0, 10];

func combine(a : Nat, b : Nat) : Nat {
    a + b;
};

let sum = Array.foldLeft<Nat, Nat>(array, 30, combine);
// ANCHOR_END: a
