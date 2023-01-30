import Bool "mo:base/Bool";


// ANCHOR: a
let a = true;
let b = false;

let isNotEqual = Bool.notEqual(a, b);

assert isNotEqual == false;
// ANCHOR_END: a
