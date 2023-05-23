// ANCHOR: a
// `main.mo`
import Principal "mo:base/Principal";
import Buffer "mo:base/Buffer";
import Error "mo:base/Error";

import User "actor-class";

actor {
    let users = Buffer.Buffer<User.User>(1);

    public func newUser(name : Text) : async Principal {
        let instance = await User.User(name);
        users.add(instance);

        Principal.fromActor(instance);
    };

    public func readName(index : Nat) : async Text {
        switch (users.getOpt(index)) {
            case (?user) { await user.getName() };
            case (null) { throw (Error.reject "No user at index") };
        };
    };

    public func writeName(index : Nat, newName : Text) : async () {
        switch (users.getOpt(index)) {
            case (?user) { await user.setName(newName) };
            case (null) { throw (Error.reject "No user at index") };
        };
    };
};
// ANCHOR_END: a
