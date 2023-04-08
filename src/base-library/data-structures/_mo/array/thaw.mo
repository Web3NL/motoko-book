// ANCHOR: a
import Array "mo:base/Array";

let array : [Char] = ['h', 'e', 'l', 'l', 'o'];

let varArray : [var Char] = Array.thaw<Char>(array);
// ANCHOR_END: a
