//List
// ANCHOR: a
import List "mo:base/List";

let list :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

var number : Int = 5;

func edit(x : Int) : () {
number += x    
};

let iterate :() = List.iterate(list, edit);  
// ANCHOR_END: a

