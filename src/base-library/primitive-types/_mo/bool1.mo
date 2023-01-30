import Bool "mo:base/Bool";

// ANCHOR: a
let a = true;
let b = false;

let logand = Bool.logand(a, b);

assert logand == false;
// ANCHOR_END: a



