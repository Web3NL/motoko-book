// ANCHOR: a
import Debug "mo:base/Debug";

actor {
    var state = 0;

    public func incrementAndTrap() : async () {
        state += 1;
        Debug.trap("Something happpened that should not have happened");
        state += 1;
    };
};
// ANCHOR_END: a
