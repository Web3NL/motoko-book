// main.mo
import Principal "mo:base/Principal";

actor {
    public type User = (Principal, Text);

    public shared query ({ caller = id }) func getUser() : async User {
        (id, Principal.toText(id));
    };
};
