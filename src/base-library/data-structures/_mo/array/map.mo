
// ANCHOR: a
import Array "mo:base/Array";
import Nat "mo:base/Nat";

let array = [true, false, true, false];

func invert(x : Bool) : Bool {
  not x;
};

let invertedArray = Array.map<Bool, Bool>(array, invert);
// ANCHOR_END: a