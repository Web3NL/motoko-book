//List
import List "mo:base/List";
import Int "mo:base/Int";

// ANCHOR: a
let list :  List.List<Int> =?(1, ?(0, ?(-1, null))); 

func change(x : Int) : Bool {
x > 0
};

let filter : List.List<Int> = List.filter<Int>(list, change);// ?(1, null)))
// ANCHOR_END: a

