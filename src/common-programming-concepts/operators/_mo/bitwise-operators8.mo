// ANCHOR: a
let a : Int8 = -128;    // minimum value for a 8-bit signed integer
let b : Int8 = 1;
let c : Int8 = a -% b;  // wraps around to 127
// ANCHOR_END: a