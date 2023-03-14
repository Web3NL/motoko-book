import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-2);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);
intStorage.add(2);

let prefix : Buffer.Buffer<Int> = Buffer.prefix(intStorage, 3); 
let text : Text = Buffer.toText(prefix, Int.toText); // => "[-2, -1, 0]"
// ANCHOR_END: a
