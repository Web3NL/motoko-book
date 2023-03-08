import Array "mo:base/Array";
// ANCHOR: a

let array = [true, false, true, false];

var number = 0;

for(key in array.keys()){
    number += key
};

assert number == 6;

// ANCHOR_END: a