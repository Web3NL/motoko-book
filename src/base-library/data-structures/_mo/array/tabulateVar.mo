import Array "mo:base/Array";
// ANCHOR: a
let size : Nat = 3;

func generator(i : Nat) : Nat { i*5 };

let a : [var Nat] = Array.tabulateVar<Nat>(size, generator);

// [0, 5, 10] : [Nat]
// ANCHOR_END: a