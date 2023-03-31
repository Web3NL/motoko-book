// ANCHOR: a
import Array "mo:base/Array";

let array = ["ICP", "will", "grow", "?"];

var sentance = "";

for (value in array.vals()) {
    sentance #= value;
};
// ANCHOR_END: a
