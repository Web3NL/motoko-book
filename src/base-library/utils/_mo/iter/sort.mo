
import Iter "mo:base/Iter";
import Order "mo:base/Order";


// ANCHOR: a

let myRange = Iter.range(1, 3);

func compare(a : Nat, b : Nat) : Order.Order {  #greater };

let sort = Iter.sort<Nat>(myRange, compare);

let array = Iter.toArray(sort);

// [3, 2, 1] : [Nat] 
// ANCHOR_END: a

