// Blob

import Blob "mo:base/Blob";


// ANCHOR: a
let a : [Nat8] = [1,2,3];

let blob = Blob.fromArray(a);

let array = Blob.toArray(blob);

assert array == [1,2,3];
// ANCHOR_END: a

