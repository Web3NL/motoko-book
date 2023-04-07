//List
// ANCHOR: a
import List "mo:base/List";

let list : List.List<Int> = ?(1, ?(0, ?(-1, null)));

List.reverse(list);
// ANCHOR_END: a
