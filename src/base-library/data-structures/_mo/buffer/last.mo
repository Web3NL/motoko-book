import Buffer "mo:base/Buffer";
// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(1);
intStorage.add(1);

let last : Int = Buffer.last<Int>(intStorage)  // 1
// ANCHOR_END: a
