// ANCHOR: a
actor {
    public shared query func read() : async Nat { 0 };

    public func call_read() : async Nat {
        let future : async Nat = read();

        await future;
    };
};
// ANCHOR_END: a
