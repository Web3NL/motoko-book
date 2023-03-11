import Iter "mo:base/Iter";

// ANCHOR: a
let array = [ "bitcoin", "ETH", "ICP"];

let myRange = Iter.fromArray(array);

let size = Iter.size(myRange);

// 3 : Nat 
// ANCHOR_END: a
