// ANCHOR: a
actor {
    stable var count : Nat = 0;

    public shared query func read() : async Nat { count };

    public shared func increment() : async () { count += 1 };
};
// ANCHOR_END: a
