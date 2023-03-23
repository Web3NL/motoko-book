// ANCHOR: a
import Buffer "mo:base/Buffer";
import Iter "mo:base/Iter";
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let iter : Iter.Iter<Int> = intStorage.vals();

let array : [Int] =   Iter.toArray(iter); // 0
// ANCHOR_END: a