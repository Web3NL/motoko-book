// LET ELSEt
type Result = {
    #ok : Nat;
    #err : Text;
};

type Balance = ?Nat;

var balance : Balance = null;

func exp(){};

// ANCHOR: a
let ?x = exp() else { return };
// ANCHOR_END: a


// ANCHOR: b

// ANCHOR_END: b

// ANCHOR: c
// ANCHOR: c


func getBalance(bal : ?Nat) : Result<Nat, Text> {
    let ?amount = bal else return #err "No balance!";
    #ok amount
};
// ANCHOR_END: c

func pay(fee : Nat) : Result<Nat, Text> {
    let #ok bal = getBalance(balance) else return #err "No balance!";
    let #ok rest = bal + fee else return #err "Can't pay!"
};