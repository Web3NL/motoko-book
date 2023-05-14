actor {
    var x = 0;

    public func incr() : async () { x += 1 };

    private func incr2() : async* () { x += 1 };

    private func call() : async* () {
        x += 1; // first state muation
        await incr(); // current state is comitted, new message send occurs

        x += 1; // third state mutation
        await* incr2(); // state is not comitted, no message send occurs

        // state is comitted when function exits successfully
    };
};
