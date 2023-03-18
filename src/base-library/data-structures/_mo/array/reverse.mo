
// ANCHOR: a
import Array "mo:base/Array";
import Nat "mo:base/Nat";

let rank : [Text] = ["first", "second", "third"];

let reverse : [Text] = Array.reverse<Text>(rank);  
// ANCHOR_END: a