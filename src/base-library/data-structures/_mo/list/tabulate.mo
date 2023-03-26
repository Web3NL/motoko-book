//List
// ANCHOR: a
import List "mo:base/List";


func change(x : Int) : Int {
    x*2
};

let tabulate : List.List<Int> = List.tabulate<Int>(3, change);
// ANCHOR_END: a

