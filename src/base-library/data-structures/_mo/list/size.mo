//List
import List "mo:base/List";

// ANCHOR: a
let list :  List.List<Int> =?(1, ?(0, ?(-1, null))); 

let size : Nat = List.size(list);  // 3
// ANCHOR_END: a

