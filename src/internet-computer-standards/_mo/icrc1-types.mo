// ANCHOR: d
import Result "mo:base/Result";

type Result<Ok, Err> = Result.Result<Ok, Err>;

type ICRC1_Interface = actor {

    // General token info
    icrc1_name : shared query () -> async (Text);
    icrc1_symbol : shared query () -> async (Text);
    icrc1_decimals : shared query () -> async (Nat8);
    icrc1_fee : shared query () -> async (Nat);
    icrc1_total_supply : shared query () -> async (Nat);

    // Ledger functionality
    icrc1_minting_account : shared query () -> async (?Account);
    icrc1_balance_of : shared query (Account) -> async (Nat);
    icrc1_transfer : shared (TransferArgs) -> async (Result<Nat, TransferError>);

    // Metadata and Extensions
    icrc1_metadata : shared query () -> async ([(Text, Value)]);
    icrc1_supported_standards : shared query () -> async ([{
        name : Text;
        url : Text;
    }]);

};
// ANCHOR_END: d

// ANCHOR: a
type Timestamp = Nat64;

type Duration = Nat64;

type Value = {
    #Nat : Nat;
    #Int : Int;
    #Text : Text;
    #Blob : Blob;
};
// ANCHOR_END: a

// ANCHOR: b
type Account = {
    owner : Principal;
    subaccount : ?Subaccount;
};

type Subaccount = Blob;
// ANCHOR_END: b

// ANCHOR: c
type TransferArgs = {
    from_subaccount : ?Subaccount;
    to : Account;
    amount : Nat;
    fee : ?Nat;
    memo : ?Blob;
    created_at_time : ?Timestamp;
};

type TransferError = {
    #BadFee : { expected_fee : Nat };
    #BadBurn : { min_burn_amount : Nat };
    #InsufficientFunds : { balance : Nat };
    #TooOld;
    #CreatedInFuture : { ledger_time : Timestamp };
    #Duplicate : { duplicate_of : Nat };
    #TemporarilyUnavailable;
    #GenericError : { error_code : Nat; message : Text };
};
// ANCHOR_END: c
