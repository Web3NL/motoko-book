// ANCHOR: a
import Blob "mo:base/Blob";

let a : [Nat8] = [1,2,3];

let blob : Blob = Blob.fromArray(a);

Blob.toArrayMut(blob);
// ANCHOR_END: a
