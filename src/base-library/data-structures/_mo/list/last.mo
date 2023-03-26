//List
// ANCHOR: a
import List "mo:base/List";

let list :  List.List<Int> = ?(0, ?(-1, null));

let last : ?Int = List.last(list);  // ?-1
// ANCHOR_END: a

