//List
import List "mo:base/List";

// ANCHOR: a
let listN :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 
let listP :  List.List<Int> =?(2, ?(1, ?(0, null))); 

let newList : List.List<Int> = List.append<Int>(listP, listN)
// ?(2, ?(1, ?(0, ?(-3, ?(-2, ?(-1, null))))));  
// ANCHOR_END: a

