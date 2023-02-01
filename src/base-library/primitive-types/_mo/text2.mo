import Text "mo:base/Text";



// ANCHOR: a
type Pattern = {#char : Char; #text : Text; #predicate : (Char -> Bool)};

let text = "blockchain";

let letter : Pattern = #char 'b';

let isStartsWith = Text.startsWith( text, letter);

assert isStartsWith == true ;
// ANCHOR_END: a
