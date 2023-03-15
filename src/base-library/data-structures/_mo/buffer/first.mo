import Buffer "mo:base/Buffer";
// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(1);
intStorage.add(1);

let first : Int = Buffer.first<Int>(intStorage)  // -1
// ANCHOR_END: a
