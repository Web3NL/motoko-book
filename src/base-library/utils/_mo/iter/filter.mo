// ANCHOR: a
import Iter "mo:base/Iter";

let myRange : Iter.Iter<Nat> = Iter.range(1, 3);

func change(n : Nat) : Bool {
    n > 1;
};

let filterIter = Iter.filter<Nat>(myRange, change);

Iter.toArray(filterIter);
// ANCHOR_END: a
