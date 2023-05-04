import SPEC "icp-ledger-interface";

import Principal "mo:base/Principal";
import Error "mo:base/Error";

actor ICManagement {
    let ICP = "ryjl3-tyaaa-aaaaa-aaaba-cai";
    let icp = actor (ICP) : SPEC.Self;

    // ANCHOR: name
    func name() : async* () {
        let _ = await icp.icrc1_name();
    };
    // ANCHOR_END: name
    
    // ANCHOR: symbol
    func symbol() : async* () {
        let _ = await icp.icrc1_symbol();
    };
    // ANCHOR_END: symbol
    
    // ANCHOR: decimals
    func decimals() : async* () {
        let _ = await icp.icrc1_decimals();
    };
    // ANCHOR_END: decimals
    
    // ANCHOR: fee
    func fee() : async* () {
        let _ = await icp.icrc1_fee();
    };
    // ANCHOR_END: fee
    
    // ANCHOR: metadata
    func metadata() : async* () {
        let _ = await icp.icrc1_metadata();
    };
    // ANCHOR_END: metadata
    
    // ANCHOR: minting_account
    func minting_account() : async* () {
        let _ = await icp.icrc1_minting_account();
    };
    // ANCHOR_END: minting_account
    
    // ANCHOR: supported_standards
    func supported_standards() : async* () {
        let _ = await icp.icrc1_supported_standards();
    };
    // ANCHOR_END: supported_standards

    // ANCHOR: total_supply
    func total_supply() : async* () {
        let _ = await icp.icrc1_total_supply();
    };
    // ANCHOR_END: total_supply
    
    
    // ANCHOR: balance_of
    // Replace with your principal
    let principal : Principal = Principal.fromText("gfpvm-mqv27-7sz2a-nmav4-isngk-exxnl-g73x3-memx7-u5xbq-3alvq-dqe");

    let account : SPEC.Account = {
        owner = principal;
        subaccount = null;
    };

    func balance() : async* () {
        let _ = await icp.icrc1_balance_of(account);
    };
    // ANCHOR_END: balance_of

    // ANCHOR: transfer
    let account2 : SPEC.Account = {
        owner = principal;
        subaccount = ?[1];
    };

    let arg : SPEC.TransferArg = {
        from_subaccount = null;
        to = account2;
        amount = 1_000_000; // 0.01 ICP;
        fee = null;
        memo = null;
        created_at_time = null;
    };

    func transfer() : async* () {
        let _ = await icp.icrc1_transfer(arg);
    };
    // ANCHOR_END: transfer

    public func test() : async { #OK; #ERR : Text } {
        try {
            await* name();
            await* balance();
            await* transfer();

            #OK;
        } catch (e) {
            #ERR(Error.message(e));
        };
    };
};
