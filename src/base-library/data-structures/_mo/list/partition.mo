//List
import List "mo:base/List";
import Int "mo:base/Int";

// ANCHOR: a
let list :  List.List<Int> =?(1, ?(0, ?(-1, ?(-2, null)))); 

func change(x : Int) : Bool {
x >= 0
};

let partition : (List.List<Int>, List.List<Int>) = List.partition<Int>(list, change);
// (?(1, ?(0, null)), ?(-1, ?(-2, null)))
// ANCHOR_END: a

