import Buffer "mo:base/Buffer";
import Hash "mo:base/Hash";
import Int "mo:base/Int";

// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let hash : Hash.Hash = Buffer.hash(intStorage, Int.hash);  //  1755518090
// ANCHOR_END: a
