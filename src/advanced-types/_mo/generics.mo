// GENERICS
actor {
// ANCHOR: a
public type Result<Ok, Err> = {
    #ok : Ok;
    #err : Err;
};
// ANCHOR_END: a

// ANCHOR: b
func checkUsername(name : Text) : Result<(), Text> {
    let size = name.size();
    if (size < 4) #err("Too short!") 
    else if (size > 20) #err("To long!") 
    else #ok();
};
// ANCHOR_END: b

// ANCHOR: c
let result = checkUsername("SamerWeb3");

switch (result) {
    case (#ok()) { };
    case (#err(error)) { };
};
// ANCHOR_END: c

// ANCHOR: e
type Obj<T, U, V> = {
    a : T;
    b : U;
    c : V;
    d : Bool;
};

let obj : Obj<Nat, Int, Text> = {
    a = 0;
    b = -1;
    c = "Motoko";
    d = false;
};
// ANCHOR_END: e

// ANCHOR: f
type User<Device> = {
    #User : Device;
    #Admin : Device;
    #Moderator : Device;
};
// ANCHOR_END: f

// ANCHOR: g
type Hardware = {
    #Laptop;
    #Mobile;
};

let user : User<Hardware> = #User(#Mobile);
// ANCHOR_END: g

// ANCHOR: h
type Brand = {
    #Apple;
    #Samsung;
    #Dell;
};

let admin : User<Brand> = #Admin(#Dell);
// ANCHOR_END: h

}