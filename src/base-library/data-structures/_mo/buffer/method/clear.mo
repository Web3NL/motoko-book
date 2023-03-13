import Buffer "mo:base/Buffer";
// ANCHOR: a

let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let clear = intStorage.clear();

let array = Buffer.toArray(intStorage);  // [] : [Int]
// ANCHOR_END: a
