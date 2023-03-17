//List
import List "mo:base/List";

// ANCHOR: a
let list :  List.List<Int> = ?(0, ?(-1, null));

let pop : (?Int, List.List<Int>) = List.pop(list);  // (?0, null)
// ANCHOR_END: a

