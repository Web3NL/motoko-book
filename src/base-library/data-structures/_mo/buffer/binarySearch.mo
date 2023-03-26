// ANCHOR: a
import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

let intStorage = Buffer.Buffer<Int>(0);

intStorage.add(-3);
intStorage.add(-2);
intStorage.add(-1);

Buffer.binarySearch<Int>(-1, intStorage, Int.compare);
// ANCHOR_END: a