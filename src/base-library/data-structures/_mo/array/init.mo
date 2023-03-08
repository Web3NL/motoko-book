import Array "mo:base/Array";
// ANCHOR: a
let size : Nat = 3;

let initValue : Char = 'A';

let a : [var Char] = Array.init<Char>(size, initValue);

// ['A', 'A', 'A'] : [var Char]
// ANCHOR_END: a