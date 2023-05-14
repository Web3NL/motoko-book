actor {
    var x = 0;

    private func incr() : async* () {
        await incr2();
    };

    public func incr2() : async () { x += 1 };

    private func non_atomic() : async* () {
        await* incr();
    };
};
