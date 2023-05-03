module {
  public type Account = { owner : Principal; subaccount : ?[Nat8] };

  public type MetadataValue = {
    #Int : Int;
    #Nat : Nat;
    #Blob : [Nat8];
    #Text : Text;
  };

  public type Result = { #Ok : Nat; #Err : TransferError };

  public type StandardRecord = { url : Text; name : Text };

  public type TransferArg = {
    to : Account;
    fee : ?Nat;
    memo : ?[Nat8];
    from_subaccount : ?[Nat8];
    created_at_time : ?Nat64;
    amount : Nat;
  };

  public type TransferError = {
    #GenericError : { message : Text; error_code : Nat };
    #TemporarilyUnavailable;
    #BadBurn : { min_burn_amount : Nat };
    #Duplicate : { duplicate_of : Nat };
    #BadFee : { expected_fee : Nat };
    #CreatedInFuture : { ledger_time : Nat64 };
    #TooOld;
    #InsufficientFunds : { balance : Nat };
  };

  public type Self = actor {
    icrc1_balance_of : shared query Account -> async Nat;

    icrc1_decimals : shared query () -> async Nat8;

    icrc1_fee : shared query () -> async Nat;

    icrc1_metadata : shared query () -> async [(Text, MetadataValue)];

    icrc1_minting_account : shared query () -> async ?Account;

    icrc1_name : shared query () -> async Text;

    icrc1_supported_standards : shared query () -> async [StandardRecord];

    icrc1_symbol : shared query () -> async Text;

    icrc1_total_supply : shared query () -> async Nat;
    
    icrc1_transfer : shared TransferArg -> async Result;
  }
}