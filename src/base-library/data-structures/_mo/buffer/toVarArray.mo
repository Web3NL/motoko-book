import Buffer "mo:base/Buffer";
// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let varArray : [var Int] = Buffer.toVarArray<Int>(intStorage); // => [var -1, 0, 1]
// ANCHOR_END: a
