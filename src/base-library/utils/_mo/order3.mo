// order
import Order "mo:base/Order";
type Order = {
    #less;
    #equal;
    #greater;
};

// ANCHOR: a
let order : Order = #less;

let isGreater = Order.isGreater(order);

assert isGreater == false;
// ANCHOR_END: a
