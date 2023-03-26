//List


// ANCHOR: a
import List "mo:base/List";
import Int "mo:base/Int";
import Order "mo:base/Order";

let list1 :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 
let list2 :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

let compare : Order.Order = List.compare<Int>(list1, list2, Int.compare);
// #equal : Orde.Order
// ANCHOR_END: a

