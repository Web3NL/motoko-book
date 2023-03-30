//List
// ANCHOR: a
import List "mo:base/List";
import Int "mo:base/Int";

let list :  List.List<Int> =?(1, ?(0, ?(-1, null))); 

func change(x : Int) : ?Text {
if (x >= 0) {
   ?(Int.toText(x))
}else {
    null
}
};

List.mapFilter<Int, Text>(list, change);
// ANCHOR_END: a