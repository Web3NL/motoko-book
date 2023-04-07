// ANCHOR: a
import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

let intStorage = Buffer.Buffer<Int>(0);

intStorage.add(-2);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);
intStorage.add(2);

let prefix : Buffer.Buffer<Int> = Buffer.prefix(intStorage, 3);

Buffer.toText(prefix, Int.toText)
// ANCHOR_END: a
