// ANCHOR: a
import Array "mo:base/Array";
import Nat "mo:base/Nat";

let ages : [Nat] = [50, 20, 10, 30, 40];

let sortedAges : [Nat] = Array.sort<Nat>(ages, Nat.compare);
// ANCHOR_END: a
