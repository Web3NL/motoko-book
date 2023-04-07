// ANCHOR: a
import Text "mo:base/Text";

let text : Text = "*ICP*";

func change(c : Char) : Text {
    if(c == '*') { return "!"}
 else {return Text.fromChar(c)}
};

Text.translate(text, change)
// ANCHOR_END: a
