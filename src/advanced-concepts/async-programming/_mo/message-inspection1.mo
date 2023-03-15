import Principal "mo:base/Principal";

// ANCHOR: a
type myActor = actor {
    f1 : shared () -> async ();
    f2 : shared Nat -> async ();
    f3 : shared Text -> ();
};
// ANCHOR_END: a

// ANCHOR: b
type CallArgs = {
    caller : Principal;
    arg : Blob;
    msg : {
        #f1 : () -> ();
        #f2 : () -> Nat;
        #f3 : () -> Text;
    };
};
// ANCHOR_END: b


//ANCHOR: c

//ANCHOR_END: c