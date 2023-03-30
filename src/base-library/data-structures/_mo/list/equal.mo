//List
// ANCHOR: a
import List "mo:base/List";
import Int "mo:base/Int";

let list1 :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 
let list2 :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

List.equal<Int>(list1, list2, Int.equal);
// ANCHOR_END: a