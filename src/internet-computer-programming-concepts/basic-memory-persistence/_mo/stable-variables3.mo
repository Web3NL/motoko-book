// ANCHOR: a
type MyObject = {
    var a : Nat;
};

let myObject : MyObject = object {
    public var a : Nat = 0;
};

myObject.a := 5;

// This is not allowed:
// stable var obj = myObject;
// ANCHOR_END: a
