// ANCHOR: a
import Array "mo:base/Array";
import Nat "mo:base/Nat";

let array1 = [1, 2, 3, 4, 5];

func filter(x : Nat) : ?Text {
  if (x > 3) null else ?Nat.toText(100 / x);
};

let array2 = Array.mapFilter<Nat, Text>(array1, filter);
// ANCHOR_END: a
