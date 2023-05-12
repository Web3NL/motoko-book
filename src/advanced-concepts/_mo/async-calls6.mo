actor {
    // ANCHOR: a
    var x = 0;

    public func mutate_atomically() : async Text {
        x += 1;
        "changed state and executed till end";
    };
    // ANCHOR_END: a

    // ANCHOR: b
    var y = 0;

    public func early_return(b : Bool) : async Text {
        y += 1; // mutate state

        if (b) return "returned early";

        y += 1; // mutate state

        "executed till end";
    };
    // ANCHOR_END: b
};
