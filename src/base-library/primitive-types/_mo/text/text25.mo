// ANCHOR: a
import Text "mo:base/Text";

let text : Text = "PCI";

func change(c : Char) : Char {
    if(c == 'P') { return 'I'}
    else if (c == 'I') {return 'P'}
    else {return 'C'}
};

Text.map(text, change)
// ANCHOR_END: a
