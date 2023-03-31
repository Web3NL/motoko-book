// ANCHOR: a
import Array "mo:base/Array";

let varArray : [var Text] = [var "apple", "banana", "cherry", "date", "elderberry"];

varArray[1] := "kiwi";

let a : [Text] = Array.freeze<Text>(varArray);
// ANCHOR_END: a
