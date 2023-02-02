// Blob

// ANCHOR: a
import Blob "mo:base/Blob";
// ANCHOR_END: a

// ANCHOR: b
let arr : [Nat8] = [1,2,3];

let arrayToBlob = Blob.fromArray(arr);

// assert arrayToBlob == {1; 2; 3};
// ANCHOR_END: b

// ANCHOR: c
let blobToArray = Blob.toArray(arrayToBlob);

assert blobToArray == [1,2,3];
// ANCHOR_END: c

