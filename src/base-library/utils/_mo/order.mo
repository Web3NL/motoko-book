// Order

// ANCHOR: a
import Order "mo:base/Order";
// ANCHOR_END: a

// ANCHOR: b

type Order = {
    #less; 
    #equal; 
    #greater
    };
// ANCHOR_END: b

// ANCHOR: c
let order : Order = #less ;
// ANCHOR_END: c

// ANCHOR: d
let isLess = Order.isLess(order);

assert isLess == true ;
// ANCHOR_END: d

// ANCHOR: e
let isEqual = Order.isEqual(order);

assert isEqual == false ;
// ANCHOR_END: e

// ANCHOR: f
let isGreater = Order.isGreater(order);

assert isGreater == false ;
// ANCHOR_END: f

// ANCHOR: g
let icpToday : Order = #less ;

let icpTomorrow : Order = #greater ;

let equal = Order.equal(icpToday, icpTomorrow);

assert equal == false ;
// ANCHOR_END: g

