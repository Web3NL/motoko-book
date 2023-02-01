

import Text "mo:base/Text";

// ANCHOR: a
type Pattern = {#char : Char; #text : Text; #predicate : (Char -> Bool)};

let text = "blockchain";

let letter : Pattern = #char 'k';

let isContained = Text.contains( text, letter);

assert isContained == true ;
// ANCHOR_END: a
