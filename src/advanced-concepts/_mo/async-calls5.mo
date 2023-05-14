// ANCHOR: a
actor {
    var s1 = 0;
    var s2 = 0;

    public func incr_s1() : async () {
        s1 += 1;
    };

    public func incr_s2() : async () {
        s2 += 1;
        ignore 0 / 0;
    };

    // A call to this function executes succesfully 
    // and increments `s1`, but not `s2`
    public func atomic() : async () {
        ignore incr_s1();
        ignore incr_s2();
    };
};
// ANCHOR_END: a
