import Array "mo:base/Array";
// ANCHOR: a

let array = [10, 20, 30];

func chain(x : Nat) : [Int]{
[x, -x]
};

let chainedArray =  Array.chain<Nat, Int>( array, chain);

assert chainedArray[1] == -10;
// ANCHOR_END: a
