// ANCHOR: a
import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

let varArray : [var Int] = [var -1, 0, 1];

let buffer : Buffer.Buffer<Int> = Buffer.fromVarArray<Int>(varArray);

Buffer.toText(buffer, Int.toText) // ANCHOR_END: a
