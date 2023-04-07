// ANCHOR: a
import Iter "mo:base/Iter";
import List "mo:base/List";

let myRange : Iter.Iter<Nat> = Iter.range(1, 3);

let list : List.List<Nat> = Iter.toList(myRange);

List.last(list);
// ANCHOR_END: a
