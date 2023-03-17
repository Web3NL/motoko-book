//List
import List "mo:base/List";

// ANCHOR: a
let list :  List.List<Int> =?(-3, ?(-2, ?(-1, null))); 

var number : Int = 5;

func edit(x : Int) : () {
number += x    
};

let iterate :() = List.iterate(list, edit);  

assert number == 0;
// ANCHOR_END: a

