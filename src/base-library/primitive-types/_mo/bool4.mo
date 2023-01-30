import Bool "mo:base/Bool";


// ANCHOR: a
let a = true;
let b = false;

let isNotEqual = Bool.notEqual(a, b);

assert isNotEqual == true;
// ANCHOR_END: a
