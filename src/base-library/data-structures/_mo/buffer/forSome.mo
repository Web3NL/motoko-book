// ANCHOR: a
import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

let intStorage = Buffer.Buffer<Int>(0);

intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

func check(x : Int) : Bool {
    x > 0;
};

Buffer.forSome<Int>(intStorage, check);
// ANCHOR_END: a
