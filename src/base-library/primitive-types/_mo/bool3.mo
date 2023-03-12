import Bool "mo:base/Bool";

// ANCHOR: a
let a = true;
let b = true;

let exclusiveOr = Bool.logxor(a, b);

assert exclusiveOr == false;
// ANCHOR_END: a
