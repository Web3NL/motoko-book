// ANCHOR: a
import Array "mo:base/Array";

let array = ["ICP", "will", "grow", "?"];

var sentence = "";

for (value in array.vals()) {
    sentence #= value # " ";
};

sentence
// ANCHOR_END: a
