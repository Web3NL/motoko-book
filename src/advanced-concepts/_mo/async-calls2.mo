// ANCHOR: a
actor {
    type SomeActor = actor {
        read : shared query () -> async Nat;
    };

    let someActor : SomeActor = actor ("7po3j-syaaa-aaaal-qbqea-cai");

    public shared func callSomeActor() : async Nat {
        await someActor.read();
    };
};
// ANCHOR_END: a
