// Char
// ANCHOR: a
import Char "mo:base/Char";

let letter = 'y';

let unicode = Char.toNat32(letter);

let character = Char.fromNat32(unicode);

Char.isAlphabetic(character);
// ANCHOR_END: a