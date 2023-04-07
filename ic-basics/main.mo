import { MANAGEMENT_CANISTER; LEDGER_CANISTER } "constants/CanisterIds";
import Management "canisters/Management";
import Ledger "canisters/Ledger";

import Accounts "utils/ICRC1Accounts";

import Principal "mo:base/Principal";
import Int "mo:base/Int";
import Float "mo:base/Float";

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
};
