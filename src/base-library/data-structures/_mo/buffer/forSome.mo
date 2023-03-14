import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

// ANCHOR: a

let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

func check( x : Int) : Bool {
    x > 0
};

let forSome : Bool = Buffer.forSome<Int>(intStorage, check); // true
// ANCHOR_END: a
