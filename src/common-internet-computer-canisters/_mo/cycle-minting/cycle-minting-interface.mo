module {
  
  public type BlockIndex = Nat64;

  public type Cycles = Nat;

  public type NotifyError = {
    #Refunded : { block_index : ?BlockIndex; reason : Text };
    #InvalidTransaction : Text;
    #Other : { error_message : Text; error_code : Nat64 };
    #Processing;
    #TransactionTooOld : BlockIndex;
  };

  public type NotifyTopUpArg = {
    block_index : BlockIndex;
    canister_id : Principal;
  };
  
  public type NotifyTopUpResult = { #Ok : Cycles; #Err : NotifyError };

  public type Self = actor {
    notify_top_up : shared NotifyTopUpArg -> async NotifyTopUpResult;
  };
};
