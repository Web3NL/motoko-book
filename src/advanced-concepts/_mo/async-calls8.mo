actor {
    var x = 0;

    public func incr() : async () { x += 1 };

    private func incr2() : async* () { x += 1 };

    private func call() : async* Text {
        // awaiting 'ordinary' `async` function
        await incr();

        // awaiting `async*` function
        await* incr2();

        "awaited with both await and await*"
    };
};
