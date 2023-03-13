import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);
intStorage.add(0);
intStorage.add(0);

let lastIndexOf : ?Nat = Buffer.lastIndexOf<Int>(0, intStorage, Int.equal); // => ?4
// ANCHOR_END: a
