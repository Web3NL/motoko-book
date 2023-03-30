//List
// ANCHOR: a
import List "mo:base/List";

let listN :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 
let listP :  List.List<Int> = ?(1, ?(0, null)); 

List.zip<Int,Int>(listN, listP);
// ANCHOR_END: a