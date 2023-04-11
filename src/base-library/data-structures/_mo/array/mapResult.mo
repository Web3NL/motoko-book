// ANCHOR: a
import Array "mo:base/Array";
import Result "mo:base/Result";

let array1 = [4, 5, 2, 1];

func check(x : Nat) : Result.Result<Nat, Text> {
  if (x == 0) #err "Cannot divide by zero" else #ok(100 / x);
};

let mapResult : Result.Result<[Nat], Text> = Array.mapResult<Nat, Nat, Text>(array1, check);
// ANCHOR_END: a
