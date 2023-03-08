import Array "mo:base/Array";
import Nat "mo:base/Nat";

// ANCHOR: a
let rank : [Text] = ["first", "second", "third"];

let reverse : [Text] = Array.reverse<Text>(rank);  

assert reverse[0] == "third";

// ["third", "second", "first"] : [Text]
// ANCHOR_END: a