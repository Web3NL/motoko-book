// ACTORS

actor {

    // ANCHOR: a
    public shared query func read() : async () { 
        () 
    };

    // Has type `shared query () -> async Text`
    // ANCHOR_END: a

    // ANCHOR: b
    public shared func write() : async () { 
        () 
    };

    // Has type `shared Text -> async ()`
    // ANCHOR_END: b

    // ANCHOR: c
    public shared func oneway() { 
        () 
    };

    // Has type `shared () -> ()`
    // ANCHOR_END: c
};

