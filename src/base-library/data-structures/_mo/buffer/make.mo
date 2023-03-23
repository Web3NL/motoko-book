// ANCHOR: a
import Buffer "mo:base/Buffer";
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(1);
intStorage.add(1);

let make : Buffer.Buffer<Int> = Buffer.make<Int>(2);
let array : [Int] = Buffer.toArray(make) // [2]
// ANCHOR_END: a