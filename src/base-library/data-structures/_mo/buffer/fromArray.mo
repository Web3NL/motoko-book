// ANCHOR: a
import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

let array : [Int] = [-1, 0, 1];

let buffer : Buffer.Buffer<Int> = Buffer.fromArray<Int>(array);

Buffer.toText(buffer, Int.toText);
// ANCHOR_END: a
