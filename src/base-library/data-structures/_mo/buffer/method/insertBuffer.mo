// ANCHOR: a
import Buffer "mo:base/Buffer";

let intStorage = Buffer.Buffer<Int>(0);

intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let buffer1 = Buffer.Buffer<Int>(2);
buffer1.add(4);

intStorage.insertBuffer(3, buffer1);

Buffer.toArray(intStorage);
// ANCHOR_END: a