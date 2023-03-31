// Result

// ANCHOR: a
import Result "mo:base/Result";

let ok : Result.Result<Nat, Text> = #ok 100;

let opt : ?Nat = Result.toOption(ok);
// ANCHOR_END: a
