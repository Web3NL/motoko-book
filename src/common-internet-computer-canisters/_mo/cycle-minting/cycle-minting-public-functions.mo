import SPEC "cycle-minting-interface";
import Principal "mo:base/Principal";

import Error "mo:base/Error";

actor ICManagement {
    let ICP = "aaaaa-aa";
    let icp = actor (ICP) : SPEC.Self;

    // ANCHOR: get_icp_xdr_conversion_rate
    func get_icp_xdr_conversion_rate() : async* SPEC.IcpXdrConversionRateResponse {
        await icp.get_icp_xdr_conversion_rate();
    };
    // ANCHOR_END: get_icp_xdr_conversion_rate

    // ANCHOR: get_subnet_types_to_subnets
    func get_subnet_types_to_subnets() : async* SPEC.SubnetTypesToSubnetsResponse {
        await icp.get_subnet_types_to_subnets();
    };
    // ANCHOR_END: get_subnet_types_to_subnets

    let principal : Principal = Principal.fromText("gfpvm-mqv27-7sz2a-nmav4-isngk-exxnl-g73x3-memx7-u5xbq-3alvq-dqe");

    // ANCHOR:notify_create_canister
    let create_canister : SPEC.NotifyCreateCanisterArg = {
        controller : Principal = principal;
        block_index : BlockIndex = 1;
        subnet_type : ?Text = null;
    };
    func notify_create_canister() : async* SPEC.NotifyCreateCanisterResult {
        await icp.notify_create_canister(create_canister);
    };
    // ANCHOR_END: notify_create_canister

    // ANCHOR: notify_top_up
    let top_up : SPEC.NotifyTopUpArg = {
        block_index : BlockIndex = 1;
        canister_id : Principal = principal;

    };

    func notify_top_up() : async* SPEC.NotifyTopUpResult {
        await icp.notify_top_up(top_up);
    };
    // ANCHOR_END: notify_top_up

    public func test() : async { #OK; #ERR : Text } {
        try {
          ignore await* get_icp_xdr_conversion_rate() 
          ignore await* get_subnet_types_to_subnets() 
          ignore await* notify_create_canister() 
          ignore await* notify_top_up()

            #OK;
        } catch (e) {
            #ERR(Error.message(e));
        };
    };
};
