// ANCHOR: a
import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

let intStorage = Buffer.Buffer<Int>(0);

intStorage.add(-2);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);
intStorage.add(2);

let prefix = Buffer.Buffer<Int>(0);

intStorage.add(-2);
intStorage.add(-1);
intStorage.add(0);

Buffer.isPrefixOf(prefix, intStorage, Int.equal)
// ANCHOR_END: a
