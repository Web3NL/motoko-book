//List
import List "mo:base/List";

// ANCHOR: a
let list :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

let varArray : [var Int] = List.toVarArray<Int>(list);
// [ var -3, -2, -1] : [var Int]
// ANCHOR_END: a

