// FLOAT
// ANCHOR: a
import Float "mo:base/Float";

let a : Float = 51.2;
let b : Float = 5.12e1;
let epsilon : Float = 1e-6;

Float.equalWithin(a,b,epsilon)
// ANCHOR_END: a
