// Principal

// ANCHOR: a
import Principal "mo:base/Principal";

let principal1 = Principal.fromText("m7sm4-2iaaa-aaaab-qabra-cai");
let principal2 = Principal.fromText("m7sm4-2iaaa-aaaab-qabra-cai");

Principal.greater(principal1, principal2);
// ANCHOR_END: a
