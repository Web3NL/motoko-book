import Principal "mo:base/Principal";

actor {
    public shared func f1() : async () {};
    public shared func f2(n : Nat) : async () {};
    public shared func f3(t : Text) {};

    type Args = {
        caller : Principal;
        arg : Blob;
        msg : {
            #f1 : () -> (); 
            #f2 : () -> Nat; 
            #f3 : () -> Text
        };
    };

    system func inspect(args : Args) : Bool {
        false
    }
}