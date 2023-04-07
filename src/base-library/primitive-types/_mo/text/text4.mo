// ANCHOR: a
import Text "mo:base/Text";

let text : Text = "blockchain";
let letter : Text.Pattern = #char 'b';

Text.replace(text, letter, "c");
// ANCHOR_END: a
