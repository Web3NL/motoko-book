import Buffer "mo:base/Buffer";
import Int "mo:base/Int";
// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);
let element : Int = 2;
let contains : Bool = Buffer.contains(intStorage, element, Int.equal);
// false
// ANCHOR_END: a
