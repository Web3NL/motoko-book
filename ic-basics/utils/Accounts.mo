import Array "mo:base/Array";
import Nat8 "mo:base/Nat8";
import Nat64 "mo:base/Nat64";
import Iter "mo:base/Iter";
import AssocList "mo:base/AssocList";

import { SUBACCOUNT_SIZE } "../constants/Constants";

module {
    public type Account = {
        owner : Principal;
        subaccount : ?[Nat8];
    };

    public func defaultAccountFromPrincipal(p : Principal) : Account {
        { owner = p; subaccount = null };
    };

    public func subaccountFromPrincipal(p : Principal, s : Nat64) : Account {
        let bytes : [var Nat8] = Array.init<Nat8>(SUBACCOUNT_SIZE, 0);

        func shift(n : Nat64) : Nat8 {
            let x = s >> n & 0xff;
            Nat8.fromNat(Nat64.toNat(x));
        };

        for (i in Iter.range(0, 7)) {
            let i64 = Nat64.fromNat(i);
            bytes[i] := shift(i64 * 8);
        };

        { owner = p; subaccount = ?Array.freeze(bytes) };
    };
};
