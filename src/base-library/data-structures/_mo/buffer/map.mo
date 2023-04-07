// ANCHOR: a
import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

let intStorage = Buffer.Buffer<Int>(10);

intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

func change(x : Int) : Int {
    x ** 2;
};

let newBuffer : Buffer.Buffer<Int> = Buffer.map<Int, Int>(intStorage, change);

Buffer.toText(newBuffer, Int.toText)
// ANCHOR_END: a
