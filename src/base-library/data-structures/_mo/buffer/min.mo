import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let min : ?Int = Buffer.min<Int>(intStorage, Int.compare) // ?-1
// ANCHOR_END: a
