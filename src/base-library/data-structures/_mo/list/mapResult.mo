//List

// ANCHOR: a
import List "mo:base/List";
import Result "mo:base/Result";

let list : List.List<Int> = ?(1, ?(0, ?(-1, null)));

func result(x : Int) : Result.Result<Int, Text> {
    if (x >= 0) {
        #ok(x);
    } else {
        #err("it is negative list element");
    };
};

List.mapResult<Int, Int, Text>(list, result);
// ANCHOR_END: a
