// Char
// ANCHOR: a
import Char "mo:base/Char";

let letter = 'y';

let unicode = Char.toNat32(letter);

Char.fromNat32(unicode);
// ANCHOR_END: a