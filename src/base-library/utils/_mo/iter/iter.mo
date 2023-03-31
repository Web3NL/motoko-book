// Iter

// ANCHOR: a
import Iter "mo:base/Iter";
// ANCHOR_END: a

// ANCHOR: b
let myRange = Iter.range(1, 3);

let num1 = myRange.next(); // returns 1
let num2 = myRange.next(); // returns 2
let num3 = myRange.next(); // returns 3
let num4 = myRange.next(); // returns null

// ANCHOR_END: b

// ANCHOR: c
let myRevRange = Iter.revRange(5, 8);

let number1 = myRevRange.next(); // returns 8
let number2 = myRevRange.next(); // returns 7
let number3 = myRevRange.next(); // returns 6
let number4 = myRevRange.next(); // returns 5
let number5 = myRevRange.next(); // returns null

// ANCHOR_END: c
