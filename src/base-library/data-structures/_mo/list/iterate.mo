//List
// ANCHOR: a
import List "mo:base/List";
import Iter "mo:base/Iter";

let list :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

var number : Int = 5;

func edit(x : Int) : () {
number += x    
};

let iterate :() = List.iterate(list, edit);

List.toArray(list);
// ANCHOR_END: a