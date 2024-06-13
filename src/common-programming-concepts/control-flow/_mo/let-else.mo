// LET ELSEt
type Result = {
    #ok : Nat;
    #err : Any;
};

type Balance = ?Nat;

var balance : Balance = null;

// ANCHOR: a
func getBalance(bal : ?Nat) : Result {
    let ?amount = bal else return #err "No balance!";
    #ok amount
};
// ANCHOR_END: a



// ANCHOR: b
func subFee(bal : Nat, fee : Nat) : Result {
    let ?newBal = do ? { 
        let true = (bal >= fee) else null !;
        var b = bal;
        b -= fee;
        b 
    } else return #err "Not enough balance!";

    #ok newBal   
};
// ANCHOR_END: b

// ANCHOR: c
func pay(fee : Nat) : Result {
    let #ok bal = getBalance(balance) else return #err "No balance!";
    let #ok res = subFee(bal, fee) else return #err "Can't pay!";

    #ok (res);
};
// ANCHOR_END: c




// ANCHOR: d

// ANCHOR_END: d

// ANCHOR: e

// ANCHOR_END: e

//TEMP more basic subFee function
func subFeeBasic(bal : Nat, fee : Nat) : Result {
    var b = bal;
    if (bal >= fee) {
        b -= fee;
        balance := ?b;
        #ok b
    } else {
        #err "Not enough balance!"
    };
};

//TEMP subFee with let-else and if
func subFeeIf(bal : Nat, fee : Nat) : Result {
    let ?newBal = if (bal >= fee) {
        var b = bal;
        b -= fee;
        ?b 
    } else null else return #err "Not enough balance!";

    #ok newBal   
};

//TEMP subFee with let-else , label ,exp
func subtractFeeLabel(bal : Nat, fee : Nat) : async Result {
    let ?newBal = label calc : ?Nat { 
      if (bal < fee) break calc null;
      var b = bal;
      b -= fee;
      ?b 
    } else return #err "Not enough balance!";

    #ok newBal   
};
