// Order

// ANCHOR: a
import Order "mo:base/Order";
// ANCHOR_END: a

// ANCHOR: b

type Order = {
    #less;
    #equal;
    #greater;
};
// ANCHOR_END: b

// ANCHOR: c
let order : Order = #less;
// ANCHOR_END: c

// ANCHOR: d
let icpToday : Order = #less;

let icpTomorrow : Order = #greater;

let equal = Order.equal(icpToday, icpTomorrow);

assert equal == false;
// ANCHOR_END: d
