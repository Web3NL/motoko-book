import Principal "mo:base/Principal";

actor {

    public shared func f1() : async () {};
    public shared func f2(n : Nat) : async () {};
    public shared func f3(t : Text) {};

    // ANCHOR: a
    system func inspect({
        caller : Principal = id;
        msg : {
            #f1 : Any;
            #f2 : () -> Nat;
            #f3 : () -> Text;
        };
    }) : Bool {
        switch (msg) {
            case (#f2 f2Args) { f2Args() < 100 };
            case _ { not Principal.isAnonymous(id) };
        };
    };
    // ANCHOR_END: a

};
