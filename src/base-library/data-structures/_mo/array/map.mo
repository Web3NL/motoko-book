import Array "mo:base/Array";
import Nat "mo:base/Nat";

// ANCHOR: a
let array = [true, false, true, false];

func invert(x : Bool) : Bool {
  not x;
};

let invertedArray = Array.map<Bool, Bool>(array, invert);

assert invertedArray[0] == false;

 // invertedArray = [false, true, false, true]
// ANCHOR_END: a
