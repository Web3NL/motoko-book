import Array "mo:base/Array";
import Blob "mo:base/Blob";

import { SUBACCOUNT_SIZE } "../constants/Constants";

module {
    public type Account = {
        owner : Principal;
        subaccount : ?Blob;
    };

    public type SubAccountGroup = (Nat8, Nat8, Nat8);

    public func defaultAccountFromPrincipal(p : Principal) : Account {
        { owner = p; subaccount = null };
    };

    public func subaccountFromPrincipal(p : Principal, g : SubAccountGroup) : Account {
        let bytes : [var Nat8] = Array.init<Nat8>(SUBACCOUNT_SIZE, 0);
        bytes[0] := g.0;
        bytes[1] := g.1;
        bytes[2] := g.2;

        { owner = p; subaccount = ?Blob.fromArrayMut(bytes) };
    };
};
