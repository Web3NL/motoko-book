
// ANCHOR: a
import Iter "mo:base/Iter";

let myRevRange = Iter.revRange(5, 8);

let number1 = myRevRange.next(); // returns 8
let number2 = myRevRange.next(); // returns 7
let number3 = myRevRange.next(); // returns 6
let number4 = myRevRange.next(); // returns 5
let number5 = myRevRange.next(); // returns null
// ANCHOR_END: a
