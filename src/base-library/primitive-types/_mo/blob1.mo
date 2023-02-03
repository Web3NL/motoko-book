
import Blob "mo:base/Blob";


// ANCHOR: a
let a : [var Nat8] = [var 1,2,3];

let mutableArrayBlob = Blob.fromArrayMut(a);

let mutableArray = Blob.toArrayMut(mutableArrayBlob);

assert mutableArray.size() == 3;
// ANCHOR_END: b
