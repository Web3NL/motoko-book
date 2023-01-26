// PRINCIPALS

// ANCHOR: a
import P "mo:base/Principal";

let principal : Principal = P.fromText("k5b7g-kwhqt-xj6wm-rcqej-uwwp3-t2cf7-6banv-o3i66-q7dy7-pvbof-dae");
// ANCHOR_END: a

// ANCHOR: b
type MessageObject = {
    caller : Principal;
};
// ANCHOR_END: b

actor {
// ANCHOR: c
public shared (messageObject) func whoami() : async Principal {
    let {caller} = messageObject;
    caller
};
// ANCHOR_END: c
};
