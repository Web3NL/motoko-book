import Bool "mo:base/Bool";

// ANCHOR: a
let a = true;
let b = false;

let logor = Bool.logor(a, b);

assert logor == true;
// ANCHOR_END: a
