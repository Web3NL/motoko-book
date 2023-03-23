// ANCHOR: a
import Buffer "mo:base/Buffer";
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let clone = Buffer.clone(intStorage);

let array : [Int] = Buffer.toArray(clone);  //  [-1, 0, 1]
// ANCHOR_END: a