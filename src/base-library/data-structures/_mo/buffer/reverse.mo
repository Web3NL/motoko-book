// ANCHOR: a
import Buffer "mo:base/Buffer";

let intStorage = Buffer.Buffer<Int>(0);

intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let reverse : () = Buffer.reverse<Int>(intStorage);

Buffer.toArray(intStorage)
// ANCHOR_END: a
