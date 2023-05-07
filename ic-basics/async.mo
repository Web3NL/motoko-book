import M "mod";

actor {
    type A = actor {
        read : shared () -> async Nat;
        incr : shared () -> async Nat;
        trap : shared Bool -> async ();
    };
    let a : A = actor ("by6od-j4aaa-aaaaa-qaadq-cai");

    var state = 0;
    public query func read() : async Nat { state };
    public func reset() : async () { state := 0 };

    func call() : async* () {
        ignore await a.incr();
        state += 1;
        ignore await a.incr();
        state += 1;
    };

    public func test() : async Nat {
        await* call();
        0 / 0;
    };

    public func test2() : async Nat {
        ignore await a.incr();
        state += 1;
        ignore await a.incr();
        state += 1;
        0 / 0;
    };

    public func test_trap(t1 : Bool, t2 : Bool, t3 : Bool) : async () {
        state += 1;
        ignore a.trap(false);
        if (t1) {ignore 0/0};

        state += 1;

        // ------------------------

        await a.trap(false);
        if (t2) {ignore 0/0};
        
        state += 1;
        ignore a.trap(false);
        if (t3) {ignore 0/0};

        await* M.foo()
    };
};
