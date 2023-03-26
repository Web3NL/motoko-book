//List
// ANCHOR: a
import List "mo:base/List";

let listN :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 
let listP :  List.List<Int> = ?(0, ?(0, null)); 

func edit(x : Int , y : Int) : Int {
    x*y
};
let zipWith : List.List<(Int)> = List.zipWith<Int, Int, Int>(listN, listP, edit);
// ANCHOR_END: a

