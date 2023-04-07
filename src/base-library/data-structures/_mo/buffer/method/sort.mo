// ANCHOR: a
import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

let intStorage = Buffer.Buffer<Int>(0);

intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

intStorage.sort(Int.compare);

Buffer.toArray(intStorage);
// ANCHOR_END: a
