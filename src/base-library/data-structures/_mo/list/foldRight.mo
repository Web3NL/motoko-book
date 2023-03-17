//List
import List "mo:base/List";

// ANCHOR: a
let list :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

let base : Int = 10;

func change(x : Int, y : Int) : Int {
    x + y
};

let foldRight : Int = List.foldRight<Int, Int>(list, 2, change);
// 5 : Int
// ANCHOR_END: a

