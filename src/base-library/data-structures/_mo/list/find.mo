//List
import List "mo:base/List";

// ANCHOR: a
let list :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

let base : Int = 10;

func change(x : Int ) : Bool {
    x > -2
};

let find : ?Int = List.find<Int>(list, change);
// -1 : ?Int
// ANCHOR_END: a

