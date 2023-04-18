// ANCHOR: a
import Blob "mo:base/Blob";

let a : [var Nat8] = [var 253, 254, 255];

Blob.fromArrayMut(a);
// ANCHOR_END: a
