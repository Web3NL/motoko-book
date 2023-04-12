import { MANAGEMENT_CANISTER; LEDGER_CANISTER; CYCLES_MINTING_CANISTER } "constants/CanisterIds";
import Management "canisters/Management";
import Ledger "canisters/Ledger";
import CMC "canisters/CyclesMinter";

import Accounts "utils/Accounts";

import Account "Accounts";

import Principal "mo:base/Principal";
import Int "mo:base/Int";
import Float "mo:base/Float";
import Blob "mo:base/Blob";
import Array "mo:base/Array";
import Nat8 "mo:base/Nat8";
import Nat64 "mo:base/Nat64";
import CanisterIds "constants/CanisterIds";

actor Basics {
    public func cycleBalance() : async Text {
        let m : Management.ManagementCanister = actor (MANAGEMENT_CANISTER);
        let status = await m.canister_status({
            canister_id = Principal.fromActor(Basics);
        });
        let float = Float.fromInt(Int.abs(status.cycles)) / 10 ** 12;
        Float.format(#fix 3, float) # " TCycles";
    };

    public func icpBalance() : async Nat {
        let l : Ledger.LedgerCanister = actor (LEDGER_CANISTER);
        let account : Accounts.Account = Accounts.defaultAccountFromPrincipal(Principal.fromActor(Basics));
        await l.icrc1_balance_of(account);
    };

    public func transfer_cmc() : async Ledger.Result_1 {
        let subaccount = subaccountFromPrincipal(Principal.fromActor(Basics));

        let t = Account.accountIdentifier(Principal.fromText(CYCLES_MINTING_CANISTER), subaccount);

        let memo : Nat64 = 1347768404;

        let args : Ledger.TransferArgs = {
            to = Blob.toArray(t);
            memo;
            amount : Ledger.Tokens = { e8s = 10000 };
            fee = { e8s = 10000 };
            created_at_time = null;
            from_subaccount = null;
        };

        let l : Ledger.LedgerCanister = actor (LEDGER_CANISTER);
        await l.transfer(args);
    };

    public func notify_top_up(height : Nat64) : async CMC.NotifyTopUpResult {
        let cmc : CMC.Self = actor (CYCLES_MINTING_CANISTER);
        await cmc.notify_top_up(
            {
                block_index = height;
                canister_id = Principal.fromActor(Basics);
            }
        );
    };

    public query func canisterAccount() : async Account.AccountIdentifier {
        myAccountId();
    };

    func myAccountId() : Account.AccountIdentifier {
        Account.accountIdentifier(Principal.fromActor(Basics), Account.defaultSubaccount());
    };

    func subaccountFromPrincipal(principal : Principal) : Blob {
        let buf : [var Nat8] = Array.init<Nat8>(32, 0);

        let p : Blob = Principal.toBlob(principal);

        buf[0] := Nat8.fromNat(p.size());

        let a : [Nat8] = Blob.toArray(p);

        var i = 1;
        for (byte in a.vals()) {
            buf[i] := byte;
            i += 1;
        };

        Blob.fromArray(Array.freeze(buf));
    };

    // NOT WORKING. MINTING ACCOUNT UNKNOWN
    // public func burn() : async Ledger.Result {
    //     let l : Ledger.LedgerCanister = actor (LEDGER_CANISTER);
    //     await l.icrc1_transfer(
    //         {
    //             from_subaccount = null;
    //             memo = null;
    //             created_at_time = null;
    //             amount = 10000;
    //             fee = ?10000;
    //             to = {
    //                 owner = Principal.fromText(LEDGER_CANISTER);
    //                 subaccount = null;
    //             };
    //         }
    //     );
    // };
};
