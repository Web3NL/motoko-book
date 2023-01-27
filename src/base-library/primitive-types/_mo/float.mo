
// Float

// ANCHOR: a

import Float "mo:base/Float";

// ANCHOR_END: a

// ANCHOR: b

let pi = 3.14;

let float_to_int = Float.toInt(pi);
assert float_to_int == 3;

// ANCHOR_END: b

// ANCHOR: c

let square_root = Float.sqrt(pi);
assert square_root == 1.772004514666935;


// ANCHOR_END: c

// ANCHOR: d

let ceil = Float.ceil(pi);
assert ceil == 4;

// ANCHOR_END: d

// ANCHOR: e

let floor = Float.floor(pi);
assert floor == 3;

// ANCHOR_END: e

// ANCHOR: f

let x = -15;
let int_to_float = Float.fromInt(x);
assert int_to_float == -15;

// ANCHOR_END: f

// ANCHOR: g

let float_to_text = Float.toText(pi);
assert float_to_text == "3.140000";

// ANCHOR_END: g

// ANCHOR: h

let float_to_int64 = Float.toInt64(pi);
assert float_to_int64 == 3;

// ANCHOR_END: h

// ANCHOR: i

let y : Int64 =  -9223372036854775808;
let int64_to_float = Float.fromInt64(y);
assert int64_to_float == -9223372036854776000;

// ANCHOR_END: i

// ANCHOR: j

let fixed_point_format = Float.format(#fix 10 , pi);
assert fixed_point_format == "3.1400000000" ;

let exponential_format = Float.format(#exp 10 , pi);
assert exponential_format == "3.1400000000e+00" ;

let generic_format = Float.format(#gen 10 , pi);
assert generic_format == "3.14";

let hexadecimal_format = Float.format(#hex 10 , pi);
assert hexadecimal_format == "0x1.91eb851eb8p+1";

let exact_format = Float.format(#exact , pi);
assert exact_format == "3.1400000000000001";

// ANCHOR_END: j