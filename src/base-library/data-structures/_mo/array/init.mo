
// ANCHOR: a
import Array "mo:base/Array";

let size : Nat = 3;
let initValue : Char = 'A';

let a : [var Char] = Array.init<Char>(size, initValue);
// ANCHOR_END: a
