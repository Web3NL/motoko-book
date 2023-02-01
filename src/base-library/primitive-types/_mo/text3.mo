import Text "mo:base/Text";



// ANCHOR: a
type Pattern = {#char : Char; #text : Text; #predicate : (Char -> Bool)};

let text = "blockchain";

let letter : Pattern = #char 'n';

let isEndsWith = Text.endsWith( text, letter);

assert isEndsWith == true ;
// ANCHOR_END: a
