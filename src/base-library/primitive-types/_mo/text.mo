// Text

// ANCHOR: a
import Text "mo:base/Text";

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


// ANCHOR: g
let sentence = "The quick brown fox jumps over the lazy dog.";

let word = #text "dog";

let result_ = Text.endsWith( sentence, word);

assert result_ == true ;
// ANCHOR_END: g

