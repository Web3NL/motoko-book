import Buffer "mo:base/Buffer";
// ANCHOR: a

let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let get = intStorage.get(2); // 1 : Int
// ANCHOR_END: a
