//List
// ANCHOR: a
import List "mo:base/List";

let listN :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 
let listP :  List.List<Int> =?(2, ?(1, ?(0, null))); 

let listOflists : List.List<List.List<Int>> = ?(listN, ?(listP, null));
let flatten : List.List<Int> = List.flatten<Int>(listOflists);
// ?(2, ?(1, ?(0, ?(-3, ?(-2, ?(-1, null))))));  
// ANCHOR_END: a

