// ANCHOR: a
import Buffer "mo:base/Buffer";
import Iter "mo:base/Iter";
import Int "mo:base/Int";

let array : [Int] = [-1, 0, 1];

let iter : Iter.Iter<Int> = array.vals();

let buffer = Buffer.fromIter<Int>(iter);

Buffer.toText(buffer, Int.toText);
// ANCHOR_END: a
