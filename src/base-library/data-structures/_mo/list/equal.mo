//List
import List "mo:base/List";
import Int "mo:base/Int";

// ANCHOR: a
let list1 :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 
let list2 :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

let equal : Bool = List.equal<Int>(list1, list2, Int.equal);
// true : Bool
// ANCHOR_END: a

