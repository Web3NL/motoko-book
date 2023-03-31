// ANCHOR: a
let a : Int8 = 127;     // maximum value for a 8-bit signed integer
let b : Int8 = 1;
let c : Int8 = a +% b;  // wraps around to -128 
// ANCHOR_END: a
