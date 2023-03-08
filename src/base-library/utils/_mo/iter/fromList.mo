import Iter "mo:base/Iter";
import List "mo:base/List";

type List<T> = ?(T, List<T>);

// ANCHOR: a

let list : List<Nat> = null;

let list1 : List<Nat> = ?(0, null);

let list2 : List<Nat> = ?(1, list1);

let iter = Iter.fromList(list2);

let array = Iter.toArray(iter);

// [ 0, 1] : [ Nat] 
// ANCHOR_END: a
