// Text

// ANCHOR: a
import Text "mo:base/Text";

// ANCHOR_END: a

// ANCHOR: b
let text = "blockchain";
// ANCHOR_END: b

// ANCHOR: c
let textLength = Text.size(text);

assert textLength == 10;
// ANCHOR_END: c

// ANCHOR: d
let character = 'c';

let charToText = Text.fromChar(character);

assert charToText == "c";
// ANCHOR_END: d


