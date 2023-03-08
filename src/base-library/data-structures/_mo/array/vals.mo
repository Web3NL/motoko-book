import Array "mo:base/Array";
// ANCHOR: a

let array = ["ICP", "will", "grow", "?"];

var sentance = "";

for(value in array.vals()){
    sentance #= value
};

assert sentance == "ICP will grow ?";

// ANCHOR_END: a