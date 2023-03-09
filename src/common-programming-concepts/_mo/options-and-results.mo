// OPTIONS AND RESULTS

// ANCHOR: a
let a : ?Nat = ?202;
let b : ?Text = ?"DeFi";
let c : ?Bool = ?true;
// ANCHOR_END: a

// ANCHOR: b
let x : ?Nat = null;
let y : ?Text = null : Null;
// ANCHOR_END: b

// ANCHOR: c
func returnOption() : ?Nat {
    ?0
};

func returnNull() : ?Nat {
    null
};
// ANCHOR_END: c


// ANCHOR: d
type Result = {
    #ok;
    #err;
};
// ANCHOR_END: d

// ANCHOR: e
func returnOk() : Result {
    #ok
};

func returnErr() : Result {
    #err
};
// ANCHOR_END: e






