import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

// ANCHOR: a
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

let isStrictPrefixOf : Bool = Buffer.isStrictPrefixOf(prefix, intStorage, Int.equal);  // => true

// ANCHOR_END: a
