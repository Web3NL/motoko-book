// ANCHOR: a
import Buffer "mo:base/Buffer";
import Int "mo:base/Int";
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let text : Text = Buffer.toText(intStorage, Int.toText);  // "[-1, 0, 1]"
// ANCHOR_END: a