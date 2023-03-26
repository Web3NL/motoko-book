// ANCHOR: a
import Buffer "mo:base/Buffer";
import Hash "mo:base/Hash";
import Int "mo:base/Int";

let intStorage = Buffer.Buffer<Int>(0);

intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

Buffer.hash(intStorage, Int.hash);
// ANCHOR_END: a