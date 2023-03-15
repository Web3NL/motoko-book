import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-3);
intStorage.add(-2);
intStorage.add(-1);

let binarySearch : ?Nat = Buffer.binarySearch<Int>(-1, intStorage, Int.compare); // => ?2
// ANCHOR_END: a
