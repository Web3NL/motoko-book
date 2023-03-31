// MODULES

// ANCHOR: a
// module-public-functions.mo
module {
    private let MAX_SIZE = 10;

    public func checkSize(size : Nat) : Bool {
        size <= MAX_SIZE;
    };
};
// ANCHOR_END: a
