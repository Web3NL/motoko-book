// ANCHOR: a
import Array "mo:base/Array";

let array1 : [Bool] = [true, false, true, false];

func convert(x : Bool) : Nat {
  if x return 1 else 0;
};

let array2 : [Nat] = Array.map<Bool, Nat>(array1, convert);
// ANCHOR_END: a
