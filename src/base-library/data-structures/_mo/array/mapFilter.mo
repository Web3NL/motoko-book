
// ANCHOR: a
import Array "mo:base/Array";
import Nat "mo:base/Nat";

let array = [1, 2, 4, 5];

func change(x : Nat) : ?Text {
  if (x == 0) {
    return null
  }else {
    return ?Nat.toText(100/x)
  }
};

let newArray = Array.mapFilter<Nat, Text>(array, change);
// ANCHOR_END: a