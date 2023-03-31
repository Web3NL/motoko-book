// ANCHOR: a
import Buffer "mo:base/Buffer";

let intStorage = Buffer.Buffer<Int>(0);

intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let clone = Buffer.clone(intStorage);

Buffer.toArray(clone);
// ANCHOR_END: a
