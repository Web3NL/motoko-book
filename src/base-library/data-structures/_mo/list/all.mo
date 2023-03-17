//List
import List "mo:base/List";

// ANCHOR: a
let list :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

let base : Int = 10;

func change(x : Int ) : Bool {
    x > 0
};

let all : Bool = List.all<Int>(list, change);
// true : Bool
// ANCHOR_END: a

