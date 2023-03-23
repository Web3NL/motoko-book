// ANCHOR: a
import Buffer "mo:base/Buffer";
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let reserve  = intStorage.reserve(4); // 4 : Nat
// ANCHOR_END: a