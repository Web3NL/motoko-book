import Array "mo:base/Array";
// ANCHOR: a

let array = [40, 20, 0, 10];

func combine(a : Nat, b : Nat) : Nat{
a + b
};

let sum =  Array.foldLeft<Nat, Nat>( array, 30, combine);

assert sum == 100;
// ANCHOR_END: a
