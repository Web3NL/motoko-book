// ANCHOR: a
import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

let intStorage = Buffer.Buffer<Int>(0);

intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);
intStorage.add(1);
intStorage.add(1);

let removeDuplicates : () = Buffer.removeDuplicates<Int>(intStorage, Int.compare);

Buffer.toArray(intStorage)
// ANCHOR_END: a