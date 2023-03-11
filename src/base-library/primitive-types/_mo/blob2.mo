
import Blob "mo:base/Blob";


// ANCHOR: a
let a : [Nat8] = [1,2,3];

let blob = Blob.fromArray(a);

let mutableArray = Blob.toArrayMut(blob);

assert mutableArray.size() == 3;
// ANCHOR_END: a
