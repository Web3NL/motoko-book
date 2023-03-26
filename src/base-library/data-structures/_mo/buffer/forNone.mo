// ANCHOR: a
import Buffer "mo:base/Buffer";

let intStorage = Buffer.Buffer<Int>(0);

intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

func check( x : Int) : Bool {
    x > 1
};

Buffer.forNone<Int>(intStorage, check);
// ANCHOR_END: a