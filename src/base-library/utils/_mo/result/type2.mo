// Result

// ANCHOR: a
import Result "mo:base/Result";

type MyResult = Result.Result<Nat, Text>;

func doSomething(b : Bool) : MyResult {
    switch (b) {
        case true #ok(0);
        case false #err("false");
    };
};

switch (doSomething(true)) {
    case (#ok(nat)) {};
    case (#err(text)) {};
};
// ANCHOR_END: a
