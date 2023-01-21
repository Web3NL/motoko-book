// ACTOR TO CANISTER

// ANCHOR: a
// main.mo
actor {
    public shared query func hello() : async Text {
        "Hello world";
    };
};
// ANCHOR_END: a
