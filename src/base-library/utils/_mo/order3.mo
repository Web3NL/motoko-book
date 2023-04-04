// order
import Order "mo:base/Order";
type Order = {
    #less;
    #equal;
    #greater;
};

// ANCHOR: a
let order : Order = #less;

Order.isGreater(order);
// ANCHOR_END: a
