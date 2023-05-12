actor {
    var x = 0;

    private func compute() : async* Nat {
        x += 1001;
        x %= 3;
        x
    };

    private func call_compute() : async* Nat {
        let future = compute();
        await* future
    };

    public func call_compute2() :async Nat {
        await* compute()
    };
}