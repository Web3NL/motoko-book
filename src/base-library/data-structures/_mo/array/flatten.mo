import Array "mo:base/Array";
// ANCHOR: a


let arrays  = [['a', 'b'], ['c', 'd'], ['e']];

let newArray = Array.flatten(arrays);

assert newArray[4] == 'e';

// newArray = ['a', 'b', 'c', 'd', 'e'] : [Text]
// ANCHOR_END: a
