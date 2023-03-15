// Text

// ANCHOR: a
import Text "mo:base/Text";

// ANCHOR_END: a

// ANCHOR: c
let text = "blockchain";

let textLength = Text.size(text);

assert textLength == 10;
// ANCHOR_END: c

// ANCHOR: d
let character = 'c';

let charToText = Text.fromChar(character);

assert charToText == "c";
// ANCHOR_END: d


