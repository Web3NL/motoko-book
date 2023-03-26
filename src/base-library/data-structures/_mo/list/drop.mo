//List
// ANCHOR: a
import List "mo:base/List";

let list :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

let drop : List.List<Int> = List.drop<Int>(list, 2);
// ?(-1, null) 
// ANCHOR_END: a

