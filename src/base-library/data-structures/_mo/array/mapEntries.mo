import Array "mo:base/Array";
import Nat "mo:base/Nat";

// ANCHOR: a
let array = [-1, -2, -3, -4];

func change(x : Int, y : Nat) : Int {
  x * y 
};

let newArray = Array.mapEntries<Int, Int>(array, change);

assert newArray[0] == 0;

 // newArray = [0, -2, -6, -12]
// ANCHOR_END: a
