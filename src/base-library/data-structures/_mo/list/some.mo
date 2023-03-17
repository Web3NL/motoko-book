//List
import List "mo:base/List";

// ANCHOR: a
let list :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

let base : Int = 10;

func change(x : Int ) : Bool {
    x == -2
};

let some : Bool = List.some<Int>(list, change);
// true : Bool
// ANCHOR_END: a

