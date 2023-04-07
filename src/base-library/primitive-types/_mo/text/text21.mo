// ANCHOR: a
import Text "mo:base/Text";
import Array "mo:base/Array";
import Iter "mo:base/Iter";

let array : [Char] = ['I', 'C', 'P'];

let iter : Iter.Iter<Char> = Array.vals(array);

Text.fromIter(iter)
// ANCHOR_END: a
