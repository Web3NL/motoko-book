// Blob

// ANCHOR: a
import Blob "mo:base/Blob";
// ANCHOR_END: a

// ANCHOR: b
let a : [Nat8] = [1,2,3];

let blob = Blob.fromArray(a);

assert blob.size() == 3;
// ANCHOR_END: b

