// ANCHOR: a
import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Int "mo:base/Int";

let array1 : [Int] = [-1, -2, -3, -4];

func map(x : Int, y : Nat) : Text {
  Int.toText(x) # "; " # Nat.toText(y);
};

let array2 : [Text] = Array.mapEntries<Int, Text>(array1, map);
// ANCHOR_END: a
