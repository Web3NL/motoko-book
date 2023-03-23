// ANCHOR: a
import Buffer "mo:base/Buffer";
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

func check( x : Int) : Bool {
    x > 1
};
let forNone : Bool = Buffer.forNone<Int>(intStorage, check);  // true
// ANCHOR_END: a