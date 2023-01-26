// SUBTYPING

// ANCHOR: a
type User = {
    id : Nat;
};

type NamedUser = {
    id : Nat;
    name : Text;
};
// ANCHOR_END: a


// ANCHOR: b
type AnyUser = User or NamedUser;

type FullUser = User and NamedUser;
// ANCHOR_END: b


// ANCHOR: c
func getUserId( user : AnyUser ) : Nat {
    user.id
};

func getUserName( user : FullUser ) : Text {
    user.name
};
// ANCHOR_END: c


// ANCHOR: d
let user : User = {
    id = 0;
};

assert getUserId(user) == 0;
// ANCHOR_END: d


// ANCHOR: e
let namedUser : NamedUser = {
    id = 0;
    name = "Peter";
};

assert getUserName(namedUser) == "Peter"; 
// ANCHOR_END: e
