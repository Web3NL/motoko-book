// ANCHOR: a
import Iter "mo:base/Iter";

let myRange : Iter.Iter<Nat> = Iter.range(1, 3);

var sum = 0;

func update(a : Nat, b : Nat) {
    sum += a;
};

Iter.iterate(myRange, update);
// ANCHOR_END: a
