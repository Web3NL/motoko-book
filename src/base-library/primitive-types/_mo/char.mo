// Char

// ANCHOR: a

import Char "mo:base/Char";

// ANCHOR_END: a

// ANCHOR: b

let letter = 'y';

let serch_decimal = Char.isDigit(letter);

assert serch_decimal == true;

// ANCHOR_END: b

// ANCHOR: c

let unicode = Char.toNat32(letter);

// ANCHOR_END: c

// ANCHOR: d

let charecter = Char.fromNat32(unicode);

// ANCHOR_END: d

// ANCHOR: e

let isAlphabetic = Char.isAlphabetic(charecter);

assert isAlphabetic == true ;

// ANCHOR_END: e
