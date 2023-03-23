// ANCHOR: a
import Buffer "mo:base/Buffer";
import Int "mo:base/Int";
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let indexOf : ?Nat = Buffer.indexOf<Int>(1, intStorage, Int.equal); // => ?2
// ANCHOR_END: a