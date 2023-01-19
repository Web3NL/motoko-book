// ACTORS

// ANCHOR: a
actor {
    public shared query func read() : async () { 
        () 
    };

    public shared func write() : async () { 
        () 
    };

    public shared func oneway() { 
        () 
    };
};
// ANCHOR_END: a
