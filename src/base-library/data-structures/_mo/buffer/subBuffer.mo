// ANCHOR: a
import Buffer "mo:base/Buffer";
import Int "mo:base/Int";
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-3);
intStorage.add(-2);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let subBuffer : Buffer.Buffer<Int> = Buffer.subBuffer(intStorage, 2, 2);
let text : Text = Buffer.toText<Int>(subBuffer, Int.toText)  // "[-1, 0]" 
// ANCHOR_END: a