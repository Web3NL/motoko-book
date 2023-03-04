import Array "mo:base/Array";
// ANCHOR: a
let size : Nat = 3;

func generator(i : Nat) : Nat { i**2 };

let a : [Nat] = Array.tabulate<Nat>(size, generator);

// [0, 1, 4] : [Nat]
// ANCHOR_END: a