// PRINCIPALS

actor {
    // ANCHOR: a
    public shared query (msg) func call() : async Principal {
        msg.caller;
    };
    // ANCHOR_END: a
};
