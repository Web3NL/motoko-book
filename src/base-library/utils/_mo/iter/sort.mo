// ANCHOR: a
import Iter "mo:base/Iter";
import Int "mo:base/Int";

let a : [Int] = [5, 2, -3, 1];

let i : Iter.Iter<Int> = a.vals();

let sorted : Iter.Iter<Int> = Iter.sort(i, Int.compare);

Iter.toArray(sorted)
// ANCHOR_END: a
