// ANCHOR: a
import Buffer "mo:base/Buffer";
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let reverse : () = Buffer.reverse<Int>(intStorage);
let array : [Int] = Buffer.toArray(intStorage) // [1, 0, -1]
// ANCHOR_END: a