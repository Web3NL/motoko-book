//List
// ANCHOR: a
import List "mo:base/List";

let list :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

let base : Int = 10;

func change(x : Int ) : Bool {
    x > -2
};

List.find<Int>(list, change);
// ANCHOR_END: a