// ANCHOR: a
import Iter "mo:base/Iter";

let array = [var "bitcoin", "ETH", "ICP"];

let iter = Iter.fromArrayMut(array);

Iter.size(iter);
// ANCHOR_END: a
