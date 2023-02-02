
import Blob "mo:base/Blob";


// ANCHOR: a
let arr : [var Nat8] = [var 1,2,3];

let mutableArrayToBlob = Blob.fromArrayMut(arr);

// assert arrayToBlob == "true";
// ANCHOR_END: a

// ANCHOR: b
let blobToMutableArray = Blob.toArrayMut(mutableArrayToBlob);

// assert blobToMutableArray == [var 1,2,3];
// ANCHOR_END: b
