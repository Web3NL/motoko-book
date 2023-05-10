// ANCHOR: a
actor A {
    public query func read() : async Nat { 0 };

    public func call_read() : async Nat {
        let future : async Nat = read();

        let result = await future;

        result + 1
    };
};
// ANCHOR_END: a
