// ANCHOR: a
import Buffer "mo:base/Buffer";

let intStorage = Buffer.Buffer<Int>(10);

intStorage.add(-2);
intStorage.add(-1);
intStorage.add(0);

func change(x : Int) : () {
    number += x
};
var number : Int = 10;

Buffer.iterate<Int>(intStorage, change)
// ANCHOR_END: a