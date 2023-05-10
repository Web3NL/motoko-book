// ANCHOR: a
actor B {
    type ActorA = actor {
        read : query () -> async Nat;
    };

    let actorA : ActorA = actor ("7po3j-syaaa-aaaal-qbqea-cai");

    public func callActorA() : async Nat {
        await actorA.read();
    };
};
// ANCHOR_END: a
