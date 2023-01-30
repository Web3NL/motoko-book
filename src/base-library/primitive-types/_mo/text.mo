// Text

// ANCHOR: a
import Text "mo:base/Text";
import Char "mo:base/Char";

// ANCHOR_END: a

// ANCHOR: b
let text = "blockchain";
// ANCHOR_END: b

// ANCHOR: c
let text_length = Text.size(text);

assert text_length == 10;
// ANCHOR_END: c

// ANCHOR: d
let character = 'c';

let char_to_text = Text.fromChar(character);

assert char_to_text == "c";
// ANCHOR_END: d

// ANCHOR: e
type Pattern = {#char : Char; #text : Text; #predicate : (Char -> Bool)};

let myText = "Hello, world!";

let searchTerm  : Pattern = #text "world";

let isContained = Text.contains( myText, searchTerm);

assert isContained == true ;
// ANCHOR_END: e

// ANCHOR: f
let inputString = "Hello World";

let prefix: Pattern = #char 'h';

let result = Text.startsWith( inputString, prefix);

assert result == true ;
// ANCHOR_END: f

// ANCHOR: g
let sentence = "The quick brown fox jumps over the lazy dog.";

let word = #text "dog";

let result_ = Text.endsWith( sentence, word);

assert result_ == true ;
// ANCHOR_END: g

// ANCHOR: h


let latters = "cryptocurrency155.";

let letter = #char 'c';

let replace = Text.replace( latters, letter, "d");

assert result_ == true ;
// ANCHOR_END: h
