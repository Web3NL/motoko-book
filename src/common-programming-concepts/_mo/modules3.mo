// MODULES

// ANCHOR: a
import SizeChecker "module-public-functions";

let x = 5;

if (SizeChecker.checkSize(x)) {
    // do something
};
// ANCHOR_END: a

// ANCHOR: b
module {
    // public let x = 1 + 1;

    // public func compute() {
    //     8 - 5
    // };

    public func compute(x : Nat, y : Nat) : Nat {
        x * y
    };
};
// ANCHOR_END: b
