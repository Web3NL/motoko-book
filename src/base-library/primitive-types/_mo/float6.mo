// FLOAT
import Float "mo:base/Float";

// ANCHOR: a
let pi = 3.14;

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

// ANCHOR_END: a
