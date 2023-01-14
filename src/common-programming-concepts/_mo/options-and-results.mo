// OPTIONS AND RESULTS

let a : ?Nat = ?202;
let b : ?Text = ?"DeFi";
let c : ?Bool = ?true;

let x : ?Nat = null;
let y : ?Text = null : Null;

func returnOption() : ?Nat {
    ?0
};

func returnNull() : ?Nat {
    null
};

type Result = {
    #ok;
    #err;
};

func returnOk() : Result {
    #ok
};

func returnErr() : Result {
    #err
};

