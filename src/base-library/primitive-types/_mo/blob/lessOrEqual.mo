// Blob
// ANCHOR: a
import Blob "mo:base/Blob";

let blob1 : Blob = "\00\ef\00" : Blob;
let blob2 : Blob = "\00\ff\00" : Blob;

Blob.lessOrEqual(blob1,blob2);
// ANCHOR_END: a
