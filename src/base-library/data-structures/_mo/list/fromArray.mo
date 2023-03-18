//List
import List "mo:base/List";

// ANCHOR: a
let array : [Int] = [-2, -1, 0, 1, 2];

let list : List.List<Int> = List.fromArray<Int>(array);
// =>  ?(-2, ?(-1, ?(0, ?(1, ?(2, null)))))
// ANCHOR_END: a

