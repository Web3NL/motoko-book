import Array "mo:base/Array";
import Nat "mo:base/Nat";

// ANCHOR: a
let ages : [var Nat] = [var 50,40,30,20,10];

let shortedAges : () = Array.sortInPlace<Nat>(ages, Nat.compare); 

assert ages[0] == 10 ;

//  ages = [10, 20, 30, 40, 50] : [var Nat]
// ANCHOR_END: a
