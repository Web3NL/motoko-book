module {
    public type Account = { owner : Principal; subaccount : ?[Nat8] };
    
    public type Result_1 = { #Ok : Nat64; #Err : TransferError_1 };

    public type TimeStamp = { timestamp_nanos : Nat64 };

    public type Tokens = { e8s : Nat64 };

    public type TransferArgs = {
        to : [Nat8];
        fee : Tokens;
        memo : Nat64;
        from_subaccount : ?[Nat8];
        created_at_time : ?TimeStamp;
        amount : Tokens;
    };

    public type TransferError_1 = {
        #TxTooOld : { allowed_window_nanos : Nat64 };
        #BadFee : { expected_fee : Tokens };
        #TxDuplicate : { duplicate_of : Nat64 };
        #TxCreatedInFuture;
        #InsufficientFunds : { balance : Tokens };
    };

    public type Self = actor {
        transfer : shared TransferArgs -> async Result_1;
    };
};
