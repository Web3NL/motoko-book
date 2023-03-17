//List
import List "mo:base/List";

// ANCHOR: a

func change(x : Int) : Int {
    x*2
};

let tabulate : List.List<Int> = List.tabulate<Int>(3, change);
// List.List<Int> : ?(0, ?(2, ?(4, null))); 
// ANCHOR_END: a

