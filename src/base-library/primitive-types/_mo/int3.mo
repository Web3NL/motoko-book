// INT

// ANCHOR: a
import Int "mo:base/Int";
// ANCHOR_END: a

// ANCHOR: b
let integer : Int = -10;

let intToText : Text = Int.toText(integer);

assert intToText == "-10";
// ANCHOR_END: b


