
import Blob "mo:base/Blob";


// ANCHOR: a
let a : [var Nat8] = [var 1,2,3];

let blob = Blob.fromArrayMut(a);

assert blob.size() == 3;
// ANCHOR_END: a
