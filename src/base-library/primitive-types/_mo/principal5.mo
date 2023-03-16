import Principal "mo:base/Principal";


// ANCHOR: a
let principal : Principal = Principal.fromText("un4fu-tqaaa-aaaab-qadjq-cai");

let isAnonymous : Bool = Principal.isAnonymous(principal);

assert isAnonymous == false;
// ANCHOR_END: a
