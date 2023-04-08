// ANCHOR: a
import Iter "mo:base/Iter";

let myRange : Iter.Iter<Nat> = Iter.range(1, 3);

let num1 = myRange.next(); // returns 1
let num2 = myRange.next(); // returns 2
let num3 = myRange.next(); // returns 3
let num4 = myRange.next(); // returns null
// ANCHOR_END: a
