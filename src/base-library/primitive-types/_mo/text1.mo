
// ANCHOR: a
import Text "mo:base/Text";
type Pattern = {#char : Char; #text : Text; #predicate : (Char -> Bool)};

let text = "blockchain";
let letter : Pattern = #char 'k';

Text.contains(text, letter);
// ANCHOR_END: a


