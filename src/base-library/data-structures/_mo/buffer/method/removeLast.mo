import Buffer "mo:base/Buffer";
// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let removeLast = intStorage.removeLast();

let array = Buffer.toArray(intStorage);  // [-1, 0] : [Int]
// ANCHOR_END: a
