import Array "mo:base/Array";
import Nat "mo:base/Nat";

// ANCHOR: a
let ages : [Nat] = [1, 2, 5, 6, 9, 7];

func isEven(x : Nat) : Bool{
     x % 2 == 0
};

let evenAges : [Nat] = Array.filter<Nat>(ages, isEven);  

// [2, 6] : [Nat]
// ANCHOR_END: a
