//List
import List "mo:base/List";

// ANCHOR: a
let list :  List.List<Int> =?(1, ?(0, ?(-1, null))); 

let reverse : List.List<Int> = List.reverse(list);  // ?(-1, ?(0, ?(1, null)))
// ANCHOR_END: a

