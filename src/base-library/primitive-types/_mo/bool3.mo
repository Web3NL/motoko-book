import Bool "mo:base/Bool";


// ANCHOR: a
let a = true;
let b = false;

let logxor = Bool.logxor(a, b);

assert logxor == false;
// ANCHOR_END: a
