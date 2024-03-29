// ANCHOR: a
import Buffer "mo:base/Buffer";

let intStorageA = Buffer.Buffer<Int>(0);

intStorageA.add(1);
intStorageA.add(2);
intStorageA.add(3);

func change(x : Int) : Buffer.Buffer<Int> {

    let intStorageB = Buffer.Buffer<Int>(2);

    intStorageB.add(x);
    intStorageB.add(x ** 3);
    intStorageB;
};

let chain = Buffer.chain<Int, Int>(intStorageA, change);

Buffer.toArray(chain);
// ANCHOR_END: a
