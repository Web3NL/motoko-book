//List
// ANCHOR: a
import List "mo:base/List";

let list :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

let chunks : List.List<List.List<Int>> = List.chunks<Int>(1, list);
//  ?(?(-3, null), ?(?(-2, null) , ?(?(-1, null) ,null)))
// ANCHOR_END: a

