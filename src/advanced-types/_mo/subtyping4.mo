actor {

    type ArgsV2 = {
        #a;
        #b;
        #c;
    };

    type ResultV2 = {
        data : [Nat8];
        note : Text;
    };

// ANCHOR: a
public func post(n : ArgsV2) : async ResultV2 {
    { 
        data = [0, 0]; 
        note = ""; 
    }
};
// ANCHOR_END: a

};
