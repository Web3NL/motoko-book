actor {
    var state = 0;
    public query func read() : async Nat { state };

    public func incr() : async Nat { state += 1; state };
    public func reset() : async () { state := 0 };

    public func trap(trap : Bool) : async () {
        state += 1;
        if (trap) { ignore 0/0 };
    };
};
