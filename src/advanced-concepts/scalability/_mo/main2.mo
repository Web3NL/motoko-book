// ANCHOR: a
// `main.mo`
import Principal "mo:base/Principal";
import Buffer "mo:base/Buffer";

import User "actor-class";

actor {
    let users = Buffer.Buffer<User.User>(1);

    public func newUser(name : Text) : async Principal {
        let instance = await User.User(name);
        users.add(instance);

        Principal.fromActor(instance);
    };
};
// ANCHOR_END: a
