import { MANAGEMENT_CANISTER; LEDGER_CANISTER } "constants/CanisterIds";
import Management "canisters/Management";
import Ledger "canisters/Ledger";

import Accounts "utils/Accounts";

import A "Accounts";

import Principal "mo:base/Principal";
import Int "mo:base/Int";
import Float "mo:base/Float";
import Blob "mo:base/Blob";
import Array "mo:base/Array";
import Nat8 "mo:base/Nat8";

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

    public query func cmc() : async Text {
        let basics = "2lhel-3qaaa-aaaal-qbxea-cai";
        let bPrin : Principal = Principal.fromText(basics);
        let blob : Blob = Principal.toBlob(bPrin);
        let blobArray : [Nat8] = Blob.toArray(blob);

        let a : [var Nat8] = Array.init<Nat8>(32, 0);

        a[0] := Nat8.fromNat(blob.size());

        var i = 1;
        for (byte in Array.vals(blobArray)) {
            a[i] := byte;
            i += 1;
        };

        let bb = Blob.fromArray(Array.freeze(a));

        A.accountIdentifier(Principal.fromText("rkp4c-7iaaa-aaaaa-aaaca-cai"), bb);
    };
};
