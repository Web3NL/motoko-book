// PRINCIPALS

// ANCHOR: a
import P "mo:base/Principal";

actor {
    public shared query ({ caller = id }) func isAnonymous() : async Bool {
        let anon = P.fromText("2vxsx-fae");

        if (id == anon) true else false;
    };
};
// ANCHOR_END: a
