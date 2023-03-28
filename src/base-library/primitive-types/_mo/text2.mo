
// ANCHOR: a
import Text "mo:base/Text";

let text : Text = "blockchain";
let letter : Text.Pattern = #text "block";

Text.startsWith(text, letter);
// ANCHOR_END: a