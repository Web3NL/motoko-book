import Principal "mo:base/Principal";

actor {
    public shared func f1() : async () {};
    public shared func f2(n : Nat) : async () {};
    public shared func f3(t : Text) {};

    type CallArgs = {
        caller : Principal;
        arg : Blob;
        msg : {
            #f1 : () -> ();
            #f2 : () -> Nat;
            #f3 : () -> Text;
        };
    };

    system func inspect(args : CallArgs) : Bool {
        let caller = args.caller;
        if (Principal.isAnonymous(caller)) { return false };

        let msgArg = args.arg;
        if (msgArg.size() > 1024) { return false };

        switch (args.msg) {
            case (#f1 _) { true };
            case (#f2 f2Args) { f2Args() < 100 };
            case (#f3 f3Args) { f3Args() == "some text" };
        };
    };
};
