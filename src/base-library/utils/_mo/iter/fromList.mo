// ANCHOR: a
import List "mo:base/List";
import Iter "mo:base/Iter";

let list : List.List<Nat> = ?(0, ?(1, null));

let iter = Iter.fromList(list);

Iter.toArray(iter);
// ANCHOR_END: a
