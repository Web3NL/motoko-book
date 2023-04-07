// ANCHOR: a
import Array "mo:base/Array";

let size : Nat = 3;

func generator(i : Nat) : Nat { i ** 2 };

let a : [Nat] = Array.tabulate<Nat>(size, generator);
// ANCHOR_END: a
