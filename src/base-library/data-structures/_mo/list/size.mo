//List
// ANCHOR: a
import List "mo:base/List";

let list :  List.List<Int> =?(1, ?(0, ?(-1, null))); 

let size : Nat = List.size(list);  // 3
// ANCHOR_END: a

