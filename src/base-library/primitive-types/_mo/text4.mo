// ANCHOR: a
import Text "mo:base/Text";
type Pattern = {#char : Char; #text : Text; #predicate : (Char -> Bool)};

let text : Text = "blockchain";
let letter : Pattern = #char 'b';

Text.replace(text, letter, "c");
// ANCHOR_END: a
