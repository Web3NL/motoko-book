// ANCHOR: a
import Iter "mo:base/Iter";

let myRange : Iter.Iter<Nat> = Iter.range(1, 3);

Iter.toArrayMut<Nat>(myRange);
// ANCHOR_END: a
