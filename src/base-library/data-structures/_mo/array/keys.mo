// ANCHOR: a
import Array "mo:base/Array";

let array = [true, false, true, false];

var number = 0;

for(key in array.keys()){
    number += key
};
// ANCHOR_END: a