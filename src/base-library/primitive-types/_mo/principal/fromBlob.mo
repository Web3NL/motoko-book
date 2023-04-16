// ANCHOR: a
import Principal "mo:base/Principal";

let principal : Principal = Principal.fromText("un4fu-tqaaa-aaaab-qadjq-cai");
let blob : Blob = Principal.toBlob(principal);

Principal.fromBlob(blob);
// ANCHOR_END: a
