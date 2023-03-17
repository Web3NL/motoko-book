//List
import List "mo:base/List";

// ANCHOR: a
let list :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

let take : List.List<Int> = List.take<Int>(list, 2);
// ?(-3, ?(-2, null))
// ANCHOR_END: a

