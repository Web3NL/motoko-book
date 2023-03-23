// ANCHOR: a
import Buffer "mo:base/Buffer";
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let remove = intStorage.remove(1);

let array : [Int] = Buffer.toArray(intStorage);  // [-1, 1] : [Int]
// ANCHOR_END: a