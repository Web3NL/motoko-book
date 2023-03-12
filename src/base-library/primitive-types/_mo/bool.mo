// BOOL

// ANCHOR: a
import Bool "mo:base/Bool";
// ANCHOR_END: a

// ANCHOR: b
let isPrincipal = true;

let textualBoolean = Bool.toText(isPrincipal);

assert textualBoolean == "true";
// ANCHOR_END: b

// ANCHOR: c
let a = true;
let b = false;

let comparison = Bool.compare(a, b);

assert comparison == #greater;
// ANCHOR_END: c

// ANCHOR: d
let positive = true;

let negative = Bool.lognot(positive);
assert negative == false;

let logicalNot = not positive;
assert logicalNot == false;
// ANCHOR_END: d

