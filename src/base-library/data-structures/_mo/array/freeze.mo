import Array "mo:base/Array";
// ANCHOR: a

let varArray = [ var "apple", "banana", "cherry", "date", "elderberry"];

varArray[1] := "kiwi";

let a : [Text] = Array.freeze<Text>(varArray);

// ["apple", "kiwi", "cherry", "date", "elderberry"] : [Text]
// ANCHOR_END: a