import Buffer "mo:base/Buffer";
// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(3);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let put = intStorage.put(3, 2);

let array = Buffer.toArray(intStorage);  // [-1, 0, 1, 2] : [Int]
// ANCHOR_END: a
