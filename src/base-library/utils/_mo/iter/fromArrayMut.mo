import Iter "mo:base/Iter";

// ANCHOR: a
let array = [var "bitcoin", "ETH", "ICP"];

let iter = Iter.fromArrayMut(array);

let size = Iter.size(iter);

// 3 : Nat
// ANCHOR_END: a
