//List
import List "mo:base/List";

// ANCHOR: a
let list :  List.List<Int> = ?(0, ?(-1, null));

let last : ?Int = List.last(list);  // ?-1
// ANCHOR_END: a

