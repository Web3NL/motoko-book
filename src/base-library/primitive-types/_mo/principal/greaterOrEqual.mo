// Principal

// ANCHOR: a
import Principal "mo:base/Principal";

let principal1 = Principal.fromText("2vxsx-fae");
let principal2 = Principal.fromText("m7sm4-2iaaa-aaaab-qabra-cai");

Principal.greaterOrEqual(principal1, principal2);
// ANCHOR_END: a
