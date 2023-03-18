//List
import List "mo:base/List";

// ANCHOR: a
let list :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

let split : (List.List<Int>, List.List<Int>) = List.split<Int>(2, list);
// (?(-3, ?(-2, null)), ?(-1, null)) 
// ANCHOR_END: a

