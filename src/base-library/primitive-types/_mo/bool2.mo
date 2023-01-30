import Bool "mo:base/Bool";

// ANCHOR: a
let a = true;
let b = false;

let eitherIsTrue = Bool.logor(a, b);

assert eitherIsTrue == true;
// ANCHOR_END: a
