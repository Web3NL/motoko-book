// ANCHOR: a
import Buffer "mo:base/Buffer";

let intStorage = Buffer.Buffer<Int>(3);

intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

intStorage.put(3, 2);

Buffer.toArray(intStorage);
// ANCHOR_END: a