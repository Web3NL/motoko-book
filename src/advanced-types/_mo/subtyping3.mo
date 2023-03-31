actor {

    // ANCHOR: a
    type Args = {
        #a;
        #b;
    };

    type ArgsV2 = {
        #a;
        #b;
        #c;
    };

    type Result = {
        data : [Nat8];
    };

    type ResultV2 = {
        data : [Nat8];
        note : Text;
    };
    // ANCHOR_END: a

    // ANCHOR: b
    public func post(n : Args) : async Result { { data = [0, 0] } };
    // ANCHOR_END: b

};
