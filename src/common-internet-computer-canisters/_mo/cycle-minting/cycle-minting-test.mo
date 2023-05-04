import Interface "cycle-minting-interface";
import Principal "mo:base/Principal";

import Error "mo:base/Error";

actor class CMCTest({a : Nat; b : Int}) {
    // // The Cycles Minting Canister ID
    // let CMC = "rkp4c-7iaaa-aaaaa-aaaca-cai";
    // let icp = actor (CMC) : Interface.Self;

    // // ANCHOR: notify_top_up
    // let top_up : Interface.NotifyTopUpArg = {
    //     block_index : Interface.BlockIndex = 1;
    //     canister_id : Principal = principal;
    // };

    // func notify_top_up() : async* Interface.NotifyTopUpResult {
    //     await icp.notify_top_up(top_up);
    // };
    // // ANCHOR_END: notify_top_up

    // public func test() : async { #OK; #ERR : Text } {
    //     try {
    //       ignore await* notify_top_up()

    //         #OK;
    //     } catch (e) {
    //         #ERR(Error.message(e));
    //     };
    // };
};
