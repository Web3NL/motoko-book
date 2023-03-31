//List
// ANCHOR: a
import List "mo:base/List";

let list : List.List<Int> = ?(-3, ?(-2, ?(-1, null)));

List.chunks<Int>(1, list);
// ANCHOR_END: a
