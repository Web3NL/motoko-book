actor {
    type A = actor {
        read : shared () -> async Nat;
        incr : shared () -> async Nat; 
    };
    let a : A = actor("by6od-j4aaa-aaaaa-qaadq-cai");

    var state = 0;
    public query func read() : async Nat { state };
    public func reset() : async () { state := 0 };

    func call() : async* Nat { 
        await a.incr();
    };

    public func test() : async Nat {
        state := await* call();
        0/0
    }; 
};