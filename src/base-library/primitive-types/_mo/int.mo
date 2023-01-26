
// Int

// ANCHOR: a

import Int "mo:base/Int";

// ANCHOR_END: a

// ANCHOR: b

let interger = -10;

let absolute_value = Int.abs(interger);

// ANCHOR_END: b

// ANCHOR: c
let int_to_text = Int.toText(interger);

assert int_to_text == "-10";
// ANCHOR_END: c

// ANCHOR: d

let a = 20;
let b = - 20;

let minimum = Int.min(a, b);

assert minimum == -20;

// ANCHOR_END: d

// ANCHOR: e

let maximum = Int.max(a, b);

assert maximum == 20;

// ANCHOR_END: e

// ANCHOR: f

let compare = Int.compare(a, b);

assert compare == #greater;

// ANCHOR_END: f
