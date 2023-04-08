// ANCHOR: a
import Array "mo:base/Array";
import Nat "mo:base/Nat";

var ages : [var Nat] = [var 50, 20, 10, 30, 40];

Array.sortInPlace<Nat>(ages, Nat.compare);
// ANCHOR_END: a
