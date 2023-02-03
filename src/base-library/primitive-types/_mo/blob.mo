// Blob

// ANCHOR: a
import Blob "mo:base/Blob";
// ANCHOR_END: a

// ANCHOR: b
let a : [Nat8] = [1,2,3];

let arrayBlob = Blob.fromArray(a);

let array = Blob.toArray(arrayBlob);

assert array == [1,2,3];
// ANCHOR_END: b

