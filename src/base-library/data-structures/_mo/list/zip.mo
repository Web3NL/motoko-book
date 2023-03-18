//List
import List "mo:base/List";

// ANCHOR: a
let listN :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 
let listP :  List.List<Int> = ?(1, ?(0, null)); 

let zip : List.List<(Int, Int)> = List.zip<Int,Int>(listN, listP);
// ?((-3, 1), ?((-2, 0), null))
// ANCHOR_END: a

