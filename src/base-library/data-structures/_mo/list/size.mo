//List
// ANCHOR: a
import List "mo:base/List";

let list :  List.List<Int> =?(1, ?(0, ?(-1, null))); 

List.size(list);
// ANCHOR_END: a