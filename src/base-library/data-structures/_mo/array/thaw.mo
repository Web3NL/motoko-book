import Array "mo:base/Array";
// ANCHOR: a

let array : [Char] = ['h', 'e', 'l', 'l', 'o'];

let varArray : [var Char] = Array.thaw<Char>(array);

varArray[3] := 'p';

// ['h', 'e', 'l', 'p', 'o' ] : [Char]
// ANCHOR_END: a
