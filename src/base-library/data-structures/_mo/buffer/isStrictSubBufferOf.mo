// ANCHOR: a
import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

let intStorage = Buffer.Buffer<Int>(0);

intStorage.add(-2);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let subIntStorage = Buffer.Buffer<Int>(0);

intStorage.add(-1);
intStorage.add(0);

Buffer.isStrictSubBufferOf(subIntStorage, intStorage, Int.equal)
// ANCHOR_END: a
