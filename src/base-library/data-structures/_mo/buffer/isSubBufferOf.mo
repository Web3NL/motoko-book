import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-3);
intStorage.add(-2);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let subIntStorage = Buffer.Buffer<Int>(0);
intStorage.add(-3);
intStorage.add(-2);

let isSubBufferOf : Bool = Buffer.isSubBufferOf(subIntStorage, intStorage, Int.equal); 
// true
// ANCHOR_END: a
