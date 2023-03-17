import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-2);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);
intStorage.add(2);

let suffix = Buffer.Buffer<Int>(0);
intStorage.add(0);
intStorage.add(1);
intStorage.add(2);

let isStrictSuffixOf : Bool = Buffer.isStrictSuffixOf(suffix, intStorage, Int.equal);  // => true
// ANCHOR_END: a
