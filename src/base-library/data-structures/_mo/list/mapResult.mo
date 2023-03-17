//List
import List "mo:base/List";
import Result "mo:base/Result";

// ANCHOR: a
let list :  List.List<Int> =?(1, ?(0, ?(-1, null))); 

func result(x : Int) : Result.Result<Int,Text> {
if (x >= 0) {
 #ok(x)
}else {
    #err("it is negative list element")
}
};

let mapResult : Result.Result<List.List<Int>,Text> = List.mapResult<Int, Int, Text>(list, result);
// #err("it is negative list element")
// ANCHOR_END: a

