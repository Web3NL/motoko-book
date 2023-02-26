// order
import Order "mo:base/Order";
type Order = {
    #less; 
    #equal; 
    #greater
    };

// ANCHOR: a
let order : Order = #less ;

let isEqual = Order.isEqual(order);

assert isEqual == false ;
// ANCHOR_END: a
