// GENERICS

// ANCHOR: example
func checkSize<T>( data : [T] ) : Bool {
    data.size() < 100
};
// ANCHOR_END: example

// ANCHOR: a
type Result<Ok, Err> = {
    #ok : Ok; 
    #err : Err;
};
// ANCHOR_END: a

// ANCHOR: b
type UsernameError = {
    #TooShort;
    #TooLong;
};
// ANCHOR_END: b

// ANCHOR: c
type UsernameCheck = Result<(), UsernameError>;
// ANCHOR_END: c

// ANCHOR: d
func checkUsername( name : Text ) : UsernameCheck {
    let size = name.size();
    if (size < 4) #err(#TooShort)
    else if (size > 20) #err(#TooLong)
    else #ok()
};
// ANCHOR_END: d

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