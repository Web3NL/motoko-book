// Blob
// ANCHOR: a
import Blob "mo:base/Blob";

let blob : Blob = "\00\ff\00" : Blob;

Blob.hash(blob);
// ANCHOR_END: a
