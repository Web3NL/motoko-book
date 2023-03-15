import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);
intStorage.add(1);
intStorage.add(1);

let removeDuplicates : () = Buffer.removeDuplicates<Int>(intStorage, Int.compare);

let array : [Int] = Buffer.toArray(intStorage) // [1, 0, -1]
// ANCHOR_END: a
