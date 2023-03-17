//List
import List "mo:base/List";
import Int "mo:base/Int";

// ANCHOR: a
let list :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

func change(x : Int) : Text {
Int.toText(x)
};

let map : List.List<Text> = List.map<Int, Text>(list, change);// ("-3", ?("-2", ?("-1", null)))
// ANCHOR_END: a

