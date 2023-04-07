// ANCHOR: a
import Text "mo:base/Text";
import Array "mo:base/Array";
import Iter "mo:base/Iter";

let array : [Text] = ["Internet", "Computer", "Protocol"];

let iter : Iter.Iter<Text> = Array.vals(array);

let text : Text = "-";

Text.join(text, iter)
// ANCHOR_END: a
