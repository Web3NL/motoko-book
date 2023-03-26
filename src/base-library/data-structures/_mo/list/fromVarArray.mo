//List
// ANCHOR: a
import List "mo:base/List";

let varArray : [var Int] = [var -2, -1, 0, 1, 2];

let list : List.List<Int> = List.fromVarArray<Int>(varArray);
// =>  ?(-2, ?(-1, ?(0, ?(1, ?(2, null)))))
// ANCHOR_END: a

