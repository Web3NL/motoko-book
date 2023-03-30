//List
// ANCHOR: a
import List "mo:base/List";
import Int "mo:base/Int";

let list :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

func change(x : Int) : Text {
Int.toText(x)
};

List.map<Int, Text>(list, change);
// ANCHOR_END: a