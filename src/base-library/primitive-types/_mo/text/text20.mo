// ANCHOR: a
import Text "mo:base/Text";
import Iter "mo:base/Iter";

let text : Text = "xyz";

let iter : Iter.Iter<Char> = Text.toIter(text);

Iter.toArray(iter)
// ANCHOR_END: a
