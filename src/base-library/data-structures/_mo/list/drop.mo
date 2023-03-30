//List
// ANCHOR: a
import List "mo:base/List";

let list :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

List.drop<Int>(list, 2);
// ANCHOR_END: a