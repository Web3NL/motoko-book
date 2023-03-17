import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let sort = intStorage.sort(Int.compare);

let array = Buffer.toArray(intStorage);  // [-1, 0, 1] : [Int]
// ANCHOR_END: a
