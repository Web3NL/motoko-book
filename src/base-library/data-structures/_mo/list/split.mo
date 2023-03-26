//List
// ANCHOR: a
import List "mo:base/List";

let list :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

let split : (List.List<Int>, List.List<Int>) = List.split<Int>(2, list);
// ANCHOR_END: a

