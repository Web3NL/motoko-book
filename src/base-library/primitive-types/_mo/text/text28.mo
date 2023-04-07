// ANCHOR: a
import Text "mo:base/Text";
import Iter "mo:base/Iter";

let text : Text = "abcabcabc";

let letter : Text.Pattern = #char 'a';

let token : Iter.Iter<Text> = Text.tokens(text, letter);

Iter.toArray(token)
// ANCHOR_END: a
