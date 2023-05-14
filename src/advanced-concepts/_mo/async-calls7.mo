actor {
    var x = 0;

    // non-shared private func with `async*` return type
    private func compute() : async* Nat {
        x += 1001;
        x %= 3;
        x;
    };

    // non-shared private func that `await*` in its body
    private func call_compute() : async* Nat {
        let future = compute(); // future has no effect until `await*`
        await* future; // computation is performed here
    };

    // public shared func that `await*` in its body
    public func call_compute2() : async Nat {
        await* compute(); // computation is performed here
    };
};
