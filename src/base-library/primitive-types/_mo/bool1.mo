import Bool "mo:base/Bool";

// ANCHOR: a
let a = true;
let b = false;

let bothTrue = Bool.logand(a, b);

assert bothTrue == false;
// ANCHOR_END: a



