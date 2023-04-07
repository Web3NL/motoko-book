// ANCHOR: a
import Buffer "mo:base/Buffer";

let intStorage = Buffer.Buffer<Int>(10);

intStorage.add(-2);
intStorage.add(-1);
intStorage.add(0);

func change(x : Int, y : Int) : Int {
    x + y + 1;
};

let newBuffer : Buffer.Buffer<Int> = Buffer.mapEntries<Int, Int>(intStorage, change);

Buffer.toArray<Int>(newBuffer)
// ANCHOR_END: a
