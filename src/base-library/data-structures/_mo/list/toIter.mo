//List
import List "mo:base/List";
import Iter "mo:base/Iter";

// ANCHOR: a
let list :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

let iter : Iter.Iter<Int>  = List.toIter<Int>(list);

var number : Int = 10;

for(i in iter){
    number += i
};

assert number == 5;
// ANCHOR_END: a

