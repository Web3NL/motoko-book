// SWITCH

let condition = true;
// ANCHOR: a
switch (condition) {
    case (a) {};
};
// ANCHOR_END: a

// ANCHOR: b
type Color = { #Black; #White; #Blue; };

let color : Color = #Black;

var count = 0;

switch (color) {
    case (#Black) { count += 1 };
    case (#White) { count -= 1 };
    case (#Blue) { count := 0 };
};
// ANCHOR_END: b

// ANCHOR: c
type Result = {
    #ok : Nat;
    #err : Text;
};

type Balance = ?Nat;

var balance : Balance = null;

func getBalance(bal : ?Nat) : Result {
    switch (bal) {
        case (null) {
            #err "No balance!"
        };
        case (?amount) {
            #ok amount
        };
    }
};
// ANCHOR_END: c

// ANCHOR: d
let amount : Result = getBalance(balance);

balance := ?10;

let amount2 : Result = getBalance(balance);
// ANCHOR_END: d
