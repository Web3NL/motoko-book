//List
// ANCHOR: a
import List "mo:base/List";

let varArray : [var Int] = [var -2, -1, 0, 1, 2];

List.fromVarArray<Int>(varArray);
// ANCHOR_END: a