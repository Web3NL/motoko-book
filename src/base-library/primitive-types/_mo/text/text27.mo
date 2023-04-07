// ANCHOR: a
import Text "mo:base/Text";
import Iter "mo:base/Iter";

let text : Text = "this is internet computer";

let letter : Text.Pattern = #char ' ';

let split : Iter.Iter<Text> = Text.split(text, letter);

Iter.toArray(split)
// ANCHOR_END: a
