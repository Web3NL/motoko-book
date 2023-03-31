// MUTABLE ARRAYS

// ANCHOR: a
let letters : [var Text] = [var "a", "b", "c"];
// ANCHOR_END: a

// ANCHOR: b
letters[0] := "hello";
// ANCHOR_END: b

// ANCHOR: c
let size = letters.size();

letters[size - 1] := "last element";
// ANCHOR_END: c

// ANCHOR: d
[var "hello", "b", "last element"]
// ANCHOR_END: d
