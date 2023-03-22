
// ANCHOR: a
import Text "mo:base/Text";
type Pattern = {#char : Char; #text : Text; #predicate : (Char -> Bool)};

let text : Text = "blockchain";
let letter : Pattern = #char 'b';

Text.startsWith(text, letter);
// ANCHOR_END: a