// IMMUTABLE ARRAYS

// ANCHOR: a
let letters : [Text] = ["a", "b", "c"];
// ANCHOR_END: a

// ANCHOR: b
let a : Text = letters[0];
// ANCHOR_END: b

// ANCHOR: c
// WARNING: this will throw an out of bounds error
let d = letters[3];
// ANCHOR_END: c

// ANCHOR: d
let size : Nat = letters.size();
// ANCHOR_END: d

// ANCHOR: e
var numbers : [Nat] = [5, 3, 7];

numbers := [2, 6, 7, 4, 7];
// ANCHOR_END: e
