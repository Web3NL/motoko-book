// Time

// ANCHOR: a
import Time "mo:base/Time";
// ANCHOR_END: a

// ANCHOR: b
let currentTIme = Time.now();

let currentYearFrom1970 = currentTIme /((10**9)*(60)*(60)*(24)*(30)*(12));

assert currentYearFrom1970 == 53;
// ANCHOR_END: b

