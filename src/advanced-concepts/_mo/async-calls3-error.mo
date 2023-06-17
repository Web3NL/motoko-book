// ANCHOR: a
import Error "mo:base/Error";

actor {
    var state = 0;

    public func incrementAndError() : async () {
        state += 1;
        throw Error.reject("Something is not quite right, but I'm aware of it");
        state += 1;
    };
};
// ANCHOR_END: a
