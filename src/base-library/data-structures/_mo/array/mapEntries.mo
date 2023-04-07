// ANCHOR: a
import Array "mo:base/Array";
import Nat "mo:base/Nat";

let array = [-1, -2, -3, -4];

func change(x : Int, y : Nat) : Int {
  x * y;
};

let newArray = Array.mapEntries<Int, Int>(array, change);
// ANCHOR_END: a
