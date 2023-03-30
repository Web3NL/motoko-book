//List
// ANCHOR: a
import List "mo:base/List";

let listN :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 
let listP :  List.List<Int> =?(2, ?(1, ?(0, null))); 

List.append<Int>(listP, listN);
// ANCHOR_END: a
