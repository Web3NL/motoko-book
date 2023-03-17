
//List
import List "mo:base/List";

// ANCHOR: a
let nil : List.List<Int> = List.nil<Int>(); 

let newList :  List.List<Int> = List.push(-1, nil);  // ?(-1, null)
// ANCHOR_END: a

