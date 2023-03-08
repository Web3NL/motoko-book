import Iter "mo:base/Iter";


// ANCHOR: a

let myRange = Iter.range(1, 3);

var sum = 0 ;

func update (a : Nat, b : Nat) {
sum += a 
};

let iterate = Iter.iterate(myRange, update);

assert sum == 6;
// ANCHOR_END: a
