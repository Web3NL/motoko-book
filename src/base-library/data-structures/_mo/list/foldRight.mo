//List
// ANCHOR: a
import List "mo:base/List";

let list :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

let base : Int = 10;

func change(x : Int, y : Int) : Int {
    x + y
};

List.foldRight<Int, Int>(list, 2, change);
// ANCHOR_END: a