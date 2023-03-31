// ANCHOR: a
import Array "mo:base/Array";

let array = [10, 20, 30];

func chain(x : Nat) : [Int] { [x, -x] };

let chainedArray = Array.chain<Nat, Int>(array, chain);
// ANCHOR_END: a
