import Array "mo:base/Array";
import Nat "mo:base/Nat";

// ANCHOR: a
let ages : [Nat] = [50,40,30,20,10];

let shortedAges : [Nat] = Array.sort<Nat>(ages, Nat.compare);  

// [10, 20, 30, 40, 50] : [Nat]
// ANCHOR_END: a
