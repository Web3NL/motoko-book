import Interface "icp-ledger-interface";

import Principal "mo:base/Principal";
import Array "mo:base/Array";
import Error "mo:base/Error";

actor ICManagement {
    // The Ledger Canister ID
    let ICP = "ryjl3-tyaaa-aaaaa-aaaba-cai";
    let icp = actor (ICP) : Interface.Self;

    // ANCHOR: name
    func name() : async* Text {
        await icp.icrc1_name();
    };
    // ANCHOR_END: name

    // ANCHOR: symbol
    func symbol() : async* Text {
        await icp.icrc1_symbol();
    };
    // ANCHOR_END: symbol

    // ANCHOR: decimals
    func decimals() : async* Nat8 {
        await icp.icrc1_decimals();
    };
    // ANCHOR_END: decimals

    // ANCHOR: fee
    func fee() : async* Nat {
        await icp.icrc1_fee();
    };
    // ANCHOR_END: fee

    // ANCHOR: metadata
    func metadata() : async* [(Text, Interface.MetadataValue)] {
        await icp.icrc1_metadata();
    };
    // ANCHOR_END: metadata

    // ANCHOR: minting_account
    func minting_account() : async* ?Interface.Account {
        await icp.icrc1_minting_account();
    };
    // ANCHOR_END: minting_account

    // ANCHOR: supported_standards
    func supported_standards() : async* [Interface.StandardRecord] {
        await icp.icrc1_supported_standards();
    };
    // ANCHOR_END: supported_standards

    // ANCHOR: total_supply
    func total_supply() : async* Nat {
        await icp.icrc1_total_supply();
    };
    // ANCHOR_END: total_supply

    // ANCHOR: balance_of
    func balance(acc : Interface.Account) : async* Nat {
        await icp.icrc1_balance_of(acc);
    };
    // ANCHOR_END: balance_of

    // ANCHOR: transfer

    func transfer(arg : Interface.TransferArg) : async* Interface.Result {
        await icp.icrc1_transfer(arg);
    };
    // ANCHOR_END: transfer

    // ANCHOR: test
    public func test() : async { #OK : Interface.Result; #ERR : Text } {
        try {

            // Query tests
            ignore await* name();
            ignore await* symbol();
            ignore await* decimals();
            ignore await* fee();
            ignore await* metadata();
            ignore await* minting_account();
            ignore await* supported_standards();
            ignore await* total_supply();

            // Balance_of test
            // Replace with your principal
            let principal : Principal = Principal.fromText("gfpvm-mqv27-7sz2a-nmav4-isngk-exxnl-g73x3-memx7-u5xbq-3alvq-dqe");

            let account : Interface.Account = {
                owner = principal;
                subaccount = null;
            };

            ignore await* balance(account);

            // Transfer test
            var sub = Array.init<Nat8>(32, 0);
            sub[0] := 1;
            let subaccount = Array.freeze(sub);

            let account2 : Interface.Account = {
                owner = principal;
                subaccount = ?subaccount;
            };

            let arg : Interface.TransferArg = {
                from_subaccount = null;
                to = account2;
                amount = 100_000_000; // 1 ICP;
                fee = null;
                memo = null;
                created_at_time = null;
            };

            let result = await* transfer(arg);

            #OK result

        } catch (e) {
            #ERR(Error.message(e));
        };
    };
    // ANCHOR_END: test
};
