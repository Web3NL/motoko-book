import Text "mo:base/Text";



// ANCHOR: a
type Pattern = {#char : Char; #text : Text; #predicate : (Char -> Bool)};

let text = "blockchain";

let letter : Pattern = #char 'b';

let endsWith = Text.endsWith(text, letter);

assert endsWith == false ;
// ANCHOR_END: a
