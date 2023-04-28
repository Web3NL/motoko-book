// ANCHOR: a
import Order "mo:base/Order";

let icpToday : Order.Order = #less;

let icpTomorrow : Order.Order = #greater;

Order.equal(icpToday, icpTomorrow);
// ANCHOR_END: a
