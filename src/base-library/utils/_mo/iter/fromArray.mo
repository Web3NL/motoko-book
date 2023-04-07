// ANCHOR: a
import Iter "mo:base/Iter";

let array = ["bitcoin", "ETH", "ICP"];

let myRange : Iter.Iter<Nat> = Iter.fromArray(array);

Iter.size(myRange);
// ANCHOR_END: a
