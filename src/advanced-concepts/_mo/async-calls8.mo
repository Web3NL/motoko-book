actor {
    var x = 0;

    public func incr() : async () { x += 1 };

    private func incr2() : async* () { x += 1 };

    private func call() : async* () {
        // awaiting 'ordinary' `async` function
        await incr(); // current message is comitted, new message send occurs

        // awaiting `async*` function
        await* incr2(); // no message send occurs
    };
};
