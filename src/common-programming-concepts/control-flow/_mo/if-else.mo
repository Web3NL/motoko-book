// IF ELSE

let condition = true;

let x = // ANCHOR: a
if (condition) 1 else 2;
// ANCHOR_END: a

// ANCHOR: b
if (condition) {} else {};
// ANCHOR_END: b

// ANCHOR: c
let result : Text = if (condition) {
    "condition was true";
} else {
    "condition was false";
};
// ANCHOR_END: c
