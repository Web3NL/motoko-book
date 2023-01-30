import Bool "mo:base/Bool";


// ANCHOR: a
let a = true;
let b = false;

let isEqual = Bool.equal(a, b);

assert isEqual == false;
// ANCHOR_END: a
