
import Int "mo:base/Int";
import Iter "mo:base/Iter";


// ANCHOR: a

let a : [Int] = [5, 2, -3, 1];

let i : Iter.Iter<Int> = a.vals();

let sorted : Iter.Iter<Int> = Iter.sort(i, Int.compare);

Iter.toArray(sorted) 

// [-3, 1, 2, 5] : [Int] 
// ANCHOR_END: a

