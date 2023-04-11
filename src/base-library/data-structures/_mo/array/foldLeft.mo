// ANCHOR: a
import Array "mo:base/Array";

let array = [40, 20, 0, 10];

func add(a : Nat, b : Nat) : Nat {
    a + b;
};

let base : Nat = 30;

let sum : Nat = Array.foldLeft<Nat, Nat>(array, base, add);
// ANCHOR_END: a
