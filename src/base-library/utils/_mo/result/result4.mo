// Result

// ANCHOR: a
import Result "mo:base/Result";

let err : Result.Result<Nat, Text> = #err "this is wrong" ;

Result.isErr(err);
// ANCHOR_END: a