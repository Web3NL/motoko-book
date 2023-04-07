// Result

// ANCHOR: a
import Result "mo:base/Result";

let ok : Result.Result<Nat, Text> = #ok 100;

Result.isOk(ok);
// ANCHOR_END: a
