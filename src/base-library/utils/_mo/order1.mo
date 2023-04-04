// order
import Order "mo:base/Order";
type Order = {
    #less;
    #equal;
    #greater;
};

// ANCHOR: a
let order : Order = #less;

Order.isLess(order);
// ANCHOR_END: a
