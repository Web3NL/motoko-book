// ANCHOR: a
import Text "mo:base/Text";
import Char "mo:base/Char";

let text : Text = "blockchain";
let letter : Text.Pattern = #predicate (func c = Char.isAlphabetic(c));

Text.endsWith(text, letter);
// ANCHOR_END: a
