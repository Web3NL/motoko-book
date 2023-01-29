// MODULES

// ANCHOR: a
// types.mo
module {
    private type UserData = {
        name : Text;
        age : Nat;
    };

    public type User = (Nat, UserData);
}
// ANCHOR_END: a