import Interface "cycle-minting-interface";
import L "../icp-ledger/icp-ledger-interface";
// import Ledger "ledger";

import Principal "mo:base/Principal";
import Error "mo:base/Error";
import Blob "mo:base/Blob";
import Array "mo:base/Array";
import Nat8 "mo:base/Nat8";
import Nat64 "mo:base/Nat64";

actor CMCTest {
    // The Cycles Minting Canister
    let CMC = "rkp4c-7iaaa-aaaaa-aaaca-cai";
    let cmc = actor (CMC) : Interface.Self;

    // The Ledger Canister
    let LEDGER = "ryjl3-tyaaa-aaaaa-aaaba-cai";
    let icp = actor (LEDGER) : L.Self;

    // ANCHOR: burn_account
    // Create the burn account for this canister
    func burn_account() : L.Account {
        let principal : Principal = Principal.fromActor(CMCTest);

        // Create subaccount from principal
        let buf : [var Nat8] = Array.init<Nat8>(32, 0);
        let blob : Blob = Principal.toBlob(principal);

        buf[0] := Nat8.fromNat(blob.size());

        let principle_bytes : [Nat8] = Blob.toArray(blob);

        var i = 1;
        for (byte in principle_bytes.vals()) {
            buf[i] := byte;
            i += 1;
        };

        let subaccount = Array.freeze(buf);

        // Create burn account with CMC principle
        {
            owner = Principal.fromText(CMC);
            subaccount = ?subaccount;
        };
    };
    // ANCHOR_END: burn_account

    // ANCHOR: transfer
    // func transfer() : async* Ledger.Result_1 {
    //     let to = burn_account();

    //     // Special memo to indicate burn intent
    //     let memo : Nat64 = 1347768404;

    //     let arg : Ledger.TransferArgs = {
    //         to;
    //         memo;
    //         amount = 100_000_000;
    //         from_subaccount = null;
    //         fee = null;
    //         created_at_time = null;
    //     };

    //     await icp.icrc1_transfer(arg);
    // };
    // ANCHOR_END: transfer

    // ANCHOR: notify_top_up

    // func notify_top_up(block_index : Nat64) : async* Interface.NotifyTopUpResult {
    //     let top_up : Interface.NotifyTopUpArg = {
    //         block_index;
    //         canister_id : Principal = Principal.fromActor(CMCTest);
    //     };

    //     await cmc.notify_top_up(top_up);
    // };
    // // ANCHOR_END: notify_top_up

    // // ANCHOR: test
    // public func test() : async { #OK : Nat; #ERR : Text } {
    //     var index : Nat64 = 0;

    //     try {
    //         switch (await* transfer()) {
    //             case (#Ok i) index := i;
    //             case (#Err _) return #ERR "Transfer failed";
    //         };
    //     } catch (e) {
    //         return #ERR(Error.message(e));
    //     };

    //     try {
    //         switch (await* notify_top_up(index)) {
    //             case (#Ok n) return #OK n;
    //             case (#Err _) return #ERR "top up failed";
    //         };
    //     } catch (e) {
    //         #ERR(Error.message(e));
    //     };
    // ANCHOR_END: test
    public func transfer() : async L.Result {
        let to = burn_account();

        // Special memo to indicate burn intent
        let memo : Nat64 = 1347768404;

        let a = Array.init<Nat8>(8, 0);

        let n = Nat64.fromNat(Nat8.toNat(255));

        a[0] := Nat8.fromNat(Nat64.toNat(memo | n << 56));
        a[1] := Nat8.fromNat(Nat64.toNat(memo | n << 48));
        a[2] := Nat8.fromNat(Nat64.toNat(memo | n << 40));
        a[3] := Nat8.fromNat(Nat64.toNat(memo | n << 32));
        a[4] := Nat8.fromNat(Nat64.toNat(memo | n << 24));
        a[5] := Nat8.fromNat(Nat64.toNat(memo | n << 16));
        a[6] := Nat8.fromNat(Nat64.toNat(memo | n << 8));
        a[7] := Nat8.fromNat(Nat64.toNat(memo | n << 0));

        let memo2 = Array.freeze(a);

        let arg : L.TransferArg = {
            to;
            memo = ?memo2;
            amount = 100_000_000;
            from_subaccount = null;
            fee = null;
            created_at_time = null;
        };

        await icp.icrc1_transfer(arg);
    };
};

// public func t() : async Ledger.Result {
//     await* transfer();
// };

// public func t2(i : Nat64) : async Interface.NotifyTopUpResult {
//     await* notify_top_up(i);
// };

// };
