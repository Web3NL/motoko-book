// Principal

// ANCHOR: a
import Principal "mo:base/Principal";

type Account = { owner : Principal; subaccount : ?Blob };

type Ledger = actor {
  icrc1_balance_of : shared query Account -> async Nat;
};

let ledger = actor ("ryjl3-tyaaa-aaaaa-aaaba-cai") : Ledger;

Principal.fromActor(ledger);
// ANCHOR_END: a
