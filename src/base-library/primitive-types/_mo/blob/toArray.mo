// Blob
// ANCHOR: a
import Blob "mo:base/Blob";

let blob : Blob = "\0a\0b\0c" : Blob;

Blob.toArray(blob);
// ANCHOR_END: a
