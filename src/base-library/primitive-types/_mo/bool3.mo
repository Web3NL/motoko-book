import Bool "mo:base/Bool";


// ANCHOR: a
let a = true;
let b = false;

let exclusiveOr = Bool.logxor(a, b);

assert exclusiveOr == true;
// ANCHOR_END: a
