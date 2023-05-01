// ANCHOR: a
import Int64 "mo:base/Int64";

let x : Int64 = 9_223_372_036_854_775_807;
let y : Int64 = 2;

Int64.mulWrap(x, y)
// ANCHOR_END: a
