// ANCHOR: a
import Buffer "mo:base/Buffer";

let intStorage = Buffer.Buffer<Int>(10);

intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);
intStorage.add(2);

func filter(x : Int) : ?Int {
    if (x > 0) {
        ?(x * 10);
    } else {
        null;
    };
};

let newBuffer : Buffer.Buffer<Int> = Buffer.mapFilter<Int, Int>(intStorage, filter);

Buffer.toArray<Int>(newBuffer)
// ANCHOR_END: a
