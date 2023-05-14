actor {
    var x = 0;

    private func incr() : async* () { 
        await* incr2();
     };

    private func incr2() : async* () { x += 1 };

    private func atomic() : async* () {
        await* incr();
    };
};
