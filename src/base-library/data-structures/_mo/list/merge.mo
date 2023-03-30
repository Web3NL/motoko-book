//List
// ANCHOR: a
import List "mo:base/List";

let list1 :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 
let list2 :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

func change(x : Int , y : Int) : Bool {
    x <= y
};

List.merge<Int>(list1, list2, change);
// ANCHOR_END: a