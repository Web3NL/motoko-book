// ANCHOR: a
import Int64 "mo:base/Int64";

let x : Int64 = -9_223_372_036_854_775_808;
let y : Int64 = 1;

Int64.subWrap(x, y)
// ANCHOR_END: a
