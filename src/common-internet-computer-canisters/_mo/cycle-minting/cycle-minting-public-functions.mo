import SPEC "cycle-minting-interface";

import Error "mo:base/Error";

actor ICManagement {
    let ICP = "";
    let icp = actor (ICP) : SPEC.Self;

    // ANCHOR: name
    // ANCHOR_END: name


    public func test() : async { #OK; #ERR : Text } {
        try {

            #OK;
        } catch (e) {
            #ERR(Error.message(e));
        };
    };
};
