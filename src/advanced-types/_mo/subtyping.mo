// SUBTYPING

// ANCHOR: a
func returnInt() : Int {
    0 : Nat;
};
// ANCHOR_END: a

// ANCHOR: a1
type T = (Nat, Int, Text);

let t : T = (1 : Nat, 2 : Nat, "three");
// ANCHOR_END: a1

// ANCHOR: b
type Red = {
    #red : Nat8;
};

type Blue = {
    #blue : Nat8;
};

type RGB = {
    #red : Nat8;
    #blue : Nat8;
    #green : Nat8;
}; // ANCHOR_END: b

// ANCHOR: c
func rgb(color : RGB) { () };

let red : Red = #red 255;
rgb(red);

let blue : Blue = #blue 100;
rgb(blue);

let green : RGB = #green 150;
rgb(green);
// ANCHOR_END: c

// ANCHOR: d
type User = {
    id : Nat;
};

type NamedUser = {
    id : Nat;
    name : Text;
};
// ANCHOR_END: d

// ANCHOR: e
func getId(user : User) : Nat {
    user.id;
};
// ANCHOR_END: e

// ANCHOR: g
let user : User = { id = 0 };
let id = getId(user);

let namedUser : NamedUser = {
    id = 1;
    name = "SamerWeb3";
};
let id1 = getId(namedUser);
// ANCHOR_END: g

// ANCHOR: h
type V1 = actor {
    post : shared Nat -> async ();
};

type V2 = actor {
    post : shared Nat -> async ();
    get : shared () -> async Nat;
};
// ANCHOR_END: h

// ANCHOR: i
type V3 = actor {
    post : shared Nat -> async ();
    get : shared () -> async Int;
};
// ANCHOR_END: i
