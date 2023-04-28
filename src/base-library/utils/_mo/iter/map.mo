// ANCHOR: a
import Iter "mo:base/Iter";

let myRange : Iter.Iter<Nat> = Iter.range(1, 3);

func change(n : Nat) : Int {
    n * -1;
};

let mapedIter = Iter.map<Nat, Int>(myRange, change);

Iter.toArray(mapedIter);
// ANCHOR_END: a
