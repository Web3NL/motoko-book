actor {
    var x = 0;

    public func mutate() : async () { x += 1 };

    private func incr() : async* () { x += 1 };

    private func incr2() : async* () {
        await mutate();
    };

    private func non_atomic() : async* () {
        await* incr();
        await* incr2();
    };
};
