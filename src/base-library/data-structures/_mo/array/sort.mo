
// ANCHOR: a
import Array "mo:base/Array";
import Nat "mo:base/Nat";

let ages : [Nat] = [50,40,30,20,10];

let shortedAges : [Nat] = Array.sort<Nat>(ages, Nat.compare);  
// ANCHOR_END: a