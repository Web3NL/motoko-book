// Principal

// ANCHOR: a
import Principal "mo:base/Principal";

let principal1 = Principal.fromText("m7sm4-2iaaa-aaaab-qabra-cai");
let principal2 = Principal.fromText("jr7pa-rnspg-drbf2-ooaap-gmfep-773oe-z5oua-hiycn-q3sjg-ffwie-tae");

Principal.less(principal1, principal2);
// ANCHOR_END: a
