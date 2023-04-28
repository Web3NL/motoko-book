// ANCHOR: a
import Array "mo:base/Array";

let array1 = [10, 20, 30];

func chain(x : Nat) : [Int] { [x, -x] };

let array2 : [Int] = Array.chain<Nat, Int>(array1, chain);
// ANCHOR_END: a
