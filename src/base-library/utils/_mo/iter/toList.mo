import Iter "mo:base/Iter";
import List "mo:base/List";

type List<T> = ?(T, List<T>);

// ANCHOR: a
let myRange = Iter.range(1, 3);

let list = Iter.toList(myRange);

let last = List.last(list);

// ?3 : ?Nat
// ANCHOR_END: a
