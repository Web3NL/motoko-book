// BOOL

// ANCHOR: a
import Bool "mo:base/Bool";
// ANCHOR_END: a

// ANCHOR: b
let is_principal = true;

let textualBoolean = Bool.toText(is_principal);

assert textualBoolean == "true";
// ANCHOR_END: b

// ANCHOR: c
let a = true;
let b = false;

let comparison = Bool.compare(a, b);

assert comparison == #greater;
// ANCHOR_END: c
