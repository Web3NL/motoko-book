// ANCHOR: a
import Array "mo:base/Array";

let size : Nat = 3;

func generator(i : Nat) : Nat { i*5 };

let a : [var Nat] = Array.tabulateVar<Nat>(size, generator);
// ANCHOR_END: a