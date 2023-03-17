import Buffer "mo:base/Buffer";
import Iter "mo:base/Iter";

// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let iter : Iter.Iter<Int> = intStorage.vals();
let array =   Iter.toArray(iter); // 0
// ANCHOR_END: a
