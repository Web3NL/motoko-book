//List
// ANCHOR: a
import List "mo:base/List";

let list :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

let array : [Int] = List.toArray<Int>(list);
// [-3, -2, -1] : [Int]
// ANCHOR_END: a

