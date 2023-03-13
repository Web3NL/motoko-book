import Buffer "mo:base/Buffer";
// ANCHOR: a

let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let capacity : Nat = intStorage.capacity();  // 3 : Nat
// ANCHOR_END: a
