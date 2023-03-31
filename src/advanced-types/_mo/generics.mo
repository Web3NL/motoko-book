// GENERICS
actor {
    // ANCHOR: a
    public type Result<Ok, Err> = {
        #ok : Ok;
        #err : Err;
    };
    // ANCHOR_END: a

    // ANCHOR: b
    func checkUsername(name : Text) : Result<(), Text> {
        let size = name.size();
        if (size < 4) #err("Too short!") else if (size > 20) #err("To long!") else #ok();
    };
    // ANCHOR_END: b

    // ANCHOR: c
    let result = checkUsername("SamerWeb3");

    switch (result) {
        case (#ok()) {};
        case (#err(error)) {};
    };
    // ANCHOR_END: c

    // ANCHOR: d
    type Obj<T, U, V> = object {
        a : T;
        b : T -> U;
        var c : V;
        d : Bool;
    };
    // ANCHOR_END: d

    // ANCHOR: e
    let obj : Obj<Nat, Int, Text> = {
        a = 0;
        b = func(n : Nat) { -1 * n };
        var c = "Motoko";
        d = false;
    };
    // ANCHOR_END: e

};
