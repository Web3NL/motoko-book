
// ANCHOR: a
import Array "mo:base/Array";
import Nat "mo:base/Nat";

let ages : [var Nat] = [var 50,40,30,20,10];

let shortedAges : () = Array.sortInPlace<Nat>(ages, Nat.compare); 
// ANCHOR_END: a