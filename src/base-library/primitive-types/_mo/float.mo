// FLOAT

// ANCHOR: a
import Float "mo:base/Float";
// ANCHOR_END: a

// ANCHOR: b
let pi = 3.14;

let float_to_int = Float.toInt(pi);

assert float_to_int == 3;
// ANCHOR_END: b

// ANCHOR: c
let x = -15;

let int_to_float = Float.fromInt(x);

assert int_to_float == -15.;
// ANCHOR_END: c

// ANCHOR: d
let y : Int64 =  -9223372036854775808;

let int64_to_float = Float.fromInt64(y);

assert int64_to_float == -9223372036854776000;
// ANCHOR_END: d
