// ANCHOR: a
import Error "mo:base/Error";
import Debug "mo:base/Debug";

actor {
    var state = 0;

    public shared func incrementAndError() : async () {
        state += 1;
        throw Error.reject("Something is not quite right, but I'm aware of it");
        state += 1;
    };

    public shared func incrementAndTrap() : async () {
        state += 1;
        Debug.trap("Something happpened that should not have happened");
        state += 1;
    };
};
// ANCHOR_END: a
