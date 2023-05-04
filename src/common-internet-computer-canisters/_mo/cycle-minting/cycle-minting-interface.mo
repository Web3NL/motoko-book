module {
  public type AccountIdentifier = { bytes : [Nat8] };
  public type BlockIndex = Nat64;
  public type Cycles = Nat;
  public type CyclesCanisterInitPayload = {
    exchange_rate_canister : ?ExchangeRateCanister;
    last_purged_notification : ?Nat64;
    governance_canister_id : ?Principal;
    minting_account_id : ?AccountIdentifier;
    ledger_canister_id : ?Principal;
  };
  public type ExchangeRateCanister = { #Set : Principal; #Unset };
  public type IcpXdrConversionRate = {
    xdr_permyriad_per_icp : Nat64;
    timestamp_seconds : Nat64;
  };
  public type IcpXdrConversionRateResponse = {
    certificate : [Nat8];
    data : IcpXdrConversionRate;
    hash_tree : [Nat8];
  };
  public type NotifyCreateCanisterArg = {
    controller : Principal;
    block_index : BlockIndex;
    subnet_type : ?Text;
  };
  public type NotifyCreateCanisterResult = {
    #Ok : Principal;
    #Err : NotifyError;
  };
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
  public type SubnetTypesToSubnetsResponse = { data : [(Text, [Principal])] };

  public type Self = ?CyclesCanisterInitPayload -> async actor {
    get_icp_xdr_conversion_rate : shared query () -> async IcpXdrConversionRateResponse;
    get_subnet_types_to_subnets : shared query () -> async SubnetTypesToSubnetsResponse;
    notify_create_canister : shared NotifyCreateCanisterArg -> async NotifyCreateCanisterResult;
    notify_top_up : shared NotifyTopUpArg -> async NotifyTopUpResult;
  };
};
