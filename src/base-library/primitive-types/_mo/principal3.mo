import Principal "mo:base/Principal";

// ANCHOR: a
let principal : Principal = Principal.fromText("un4fu-tqaaa-aaaab-qadjq-cai");

let blob : Blob  = Principal.toBlob(principal);
// ANCHOR_END: a
