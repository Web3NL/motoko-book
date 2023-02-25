// order
import Order "mo:base/Order";
type Order = {
    #less; 
    #equal; 
    #greater
    };

// ANCHOR: a
let order : Order = #less ;

let isLess = Order.isLess(order);

assert isLess == true ;
// ANCHOR_END: a
