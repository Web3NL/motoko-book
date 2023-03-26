// ANCHOR: a
import Buffer "mo:base/Buffer";

let intStorage = Buffer.Buffer<Int>(10);

intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

Buffer.trimToSize<Int>(intStorage);

intStorage.capacity()
// ANCHOR_END: a