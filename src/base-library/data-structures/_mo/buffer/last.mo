// ANCHOR: a
import Buffer "mo:base/Buffer";

let intStorage = Buffer.Buffer<Int>(0);

intStorage.add(-1);
intStorage.add(1);
intStorage.add(1);

Buffer.last<Int>(intStorage)
// ANCHOR_END: a