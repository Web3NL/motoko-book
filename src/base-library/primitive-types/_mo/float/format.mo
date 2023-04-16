// FLOAT
// ANCHOR: a
import Float "mo:base/Float";

let pi : Float = 3.14;

let fixedPointFormat = Float.format(#fix 10, pi);
assert fixedPointFormat == "3.1400000000";

let exponentialFormat = Float.format(#exp 10, pi);
assert exponentialFormat == "3.1400000000e+00";

let genericFormat = Float.format(#gen 10, pi);
assert genericFormat == "3.14";

let hexadecimalFormat = Float.format(#hex 10, pi);
assert hexadecimalFormat == "0x1.91eb851eb8p+1";

let exactFormat = Float.format(#exact, pi);
assert exactFormat == "3.1400000000000001";
// ANCHOR_END: a
