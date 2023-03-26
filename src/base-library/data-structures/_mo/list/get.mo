//List
// ANCHOR: a
import List "mo:base/List";

let list :  List.List<Int> =?(0, ?(-1, null));

let get : ?Int = List.get(list, 0);  // ?-1
// ANCHOR_END: a

