//List
import List "mo:base/List";
import Int "mo:base/Int";

// ANCHOR: a
let list :  List.List<Int> =?(1, ?(0, ?(-1, null))); 

func change(x : Int) : ?Text {
if (x >= 0) {
 ?(Int.toText(x)
)}else {
    null
}
};

let mapFilter : List.List<Text> = List.mapFilter<Int, Text>(list, change);
// ("-3", ?("-2", ?("-1", null)))
// ANCHOR_END: a

