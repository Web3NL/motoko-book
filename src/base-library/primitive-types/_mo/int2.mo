// INT

import Int "mo:base/Int";


// ANCHOR: a
let a = 20;

let b = -20;

let compare = Int.compare(a, b);

assert compare == #greater;
// ANCHOR_END: a
