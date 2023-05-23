
// ANCHOR: a
// Actor class in separate source file `actor-class.mo`
actor class User(username : Text) {
    var name = username;

    public query func getName() : async Text { name };

    public func setName(newName : Text) : async () {
        name := newName
    };
};
// ANCHOR_END: a
