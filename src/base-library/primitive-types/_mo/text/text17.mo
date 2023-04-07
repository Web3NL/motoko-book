// ANCHOR: a
import Text "mo:base/Text";

let text : Text = "blockchain";
let letter : Text.Pattern = #char 'n';

Text.stripEnd(text, letter);
// ANCHOR_END: a
