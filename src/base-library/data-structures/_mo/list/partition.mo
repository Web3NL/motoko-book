//List
// ANCHOR: a
import List "mo:base/List";
import Int "mo:base/Int";

let list : List.List<Int> = ?(1, ?(0, ?(-1, ?(-2, null))));

func change(x : Int) : Bool {
    x >= 0;
};

List.partition<Int>(list, change);
// ANCHOR_END: a
