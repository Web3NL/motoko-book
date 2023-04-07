// ANCHOR: a
import Text "mo:base/Text";

let text : Text = "vvvblockchain";
let letter : Text.Pattern = #char 'v';

Text.trimStart(text, letter);
// ANCHOR_END: a
