//List
import List "mo:base/List";
import Int "mo:base/Int";

// ANCHOR: a
let replicate : List.List<Int> = List.replicate<Int>(3, 3);
// List.List<Int> : ?(3, ?(3, ?(3, null))); 
// ANCHOR_END: a

