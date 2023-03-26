// ANCHOR: a
import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

let intStorage = Buffer.Buffer<Int>(0);

intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

Buffer.min<Int>(intStorage, Int.compare)
// ANCHOR_END: a