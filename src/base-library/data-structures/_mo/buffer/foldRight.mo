// ANCHOR: a
import Buffer "mo:base/Buffer";

let intStorage = Buffer.Buffer<Int>(0);

intStorage.add(-1);
intStorage.add(1);
intStorage.add(2);

func change(x : Int, y : Int) : Int {
    x + y
};

Buffer.foldRight<Int, Int>(intStorage, 0, change);
// ANCHOR_END: a