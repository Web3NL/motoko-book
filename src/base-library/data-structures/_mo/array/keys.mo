// ANCHOR: a
import Array "mo:base/Array";
import Iter "mo:base/Iter";

let array = [true, false, true, false];

let iter = array.keys();

Iter.toArray(iter)
// ANCHOR_END: a
