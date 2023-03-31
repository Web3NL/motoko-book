// ANCHOR: a
import Blob "mo:base/Blob";
import Text "mo:base/Text";

let array : [Nat8] = [73, 67, 80];
let blob : Blob = Blob.fromArray(array);

Text.decodeUtf8(blob);
// ANCHOR_END: a
