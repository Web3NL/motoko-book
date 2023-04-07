module {
    public type Account = { owner : Principal; subaccount : ?[Nat8] };
    public type AccountBalanceArgs = { account : Text };
    public type ArchiveInfo = { canister_id : Principal };
    public type ArchiveOptions = {
        num_blocks_to_archive : Nat64;
        max_transactions_per_response : ?Nat64;
        trigger_threshold : Nat64;
        max_message_size_bytes : ?Nat64;
        cycles_for_archive_creation : ?Nat64;
        node_max_memory_size_bytes : ?Nat64;
        controller_id : Principal;
    };
    public type ArchivedBlocksRange = {
        callback : shared query GetBlocksArgs -> async {
            #Ok : BlockRange;
            #Err : GetBlocksError;
        };
        start : Nat64;
        length : Nat64;
    };
    public type Archives = { archives : [ArchiveInfo] };
    public type BinaryAccountBalanceArgs = { account : [Nat8] };
    public type BlockRange = { blocks : [CandidBlock] };
    public type CandidBlock = {
        transaction : CandidTransaction;
        timestamp : TimeStamp;
        parent_hash : ?[Nat8];
    };
    public type CandidOperation = {
        #Approve : {
            fee : Tokens;
            from : [Nat8];
            allowance_e8s : Int;
            expires_at : ?TimeStamp;
            spender : [Nat8];
        };
        #Burn : { from : [Nat8]; amount : Tokens };
        #Mint : { to : [Nat8]; amount : Tokens };
        #Transfer : {
            to : [Nat8];
            fee : Tokens;
            from : [Nat8];
            amount : Tokens;
        };
        #TransferFrom : {
            to : [Nat8];
            fee : Tokens;
            from : [Nat8];
            amount : Tokens;
            spender : [Nat8];
        };
    };
    public type CandidTransaction = {
        memo : Nat64;
        icrc1_memo : ?[Nat8];
        operation : ?CandidOperation;
        created_at_time : TimeStamp;
    };
    public type Decimals = { decimals : Nat32 };
    public type Duration = { secs : Nat64; nanos : Nat32 };
    public type GetBlocksArgs = { start : Nat64; length : Nat64 };
    public type GetBlocksError = {
        #BadFirstBlockIndex : {
            requested_index : Nat64;
            first_valid_index : Nat64;
        };
        #Other : { error_message : Text; error_code : Nat64 };
    };
    public type LedgerCanisterInitPayload = {
        send_whitelist : [Principal];
        token_symbol : ?Text;
        transfer_fee : ?Tokens;
        minting_account : Text;
        transaction_window : ?Duration;
        max_message_size_bytes : ?Nat64;
        icrc1_minting_account : ?Account;
        archive_options : ?ArchiveOptions;
        initial_values : [(Text, Tokens)];
        token_name : ?Text;
    };
    public type MetadataValue = {
        #Int : Int;
        #Nat : Nat;
        #Blob : [Nat8];
        #Text : Text;
    };
    public type Name = { name : Text };
    public type QueryBlocksResponse = {
        certificate : ?[Nat8];
        blocks : [CandidBlock];
        chain_length : Nat64;
        first_block_index : Nat64;
        archived_blocks : [ArchivedBlocksRange];
    };
    public type Result = { #Ok : Nat; #Err : TransferError };
    public type Result_1 = { #Ok : Nat64; #Err : TransferError_1 };
    public type SendArgs = {
        to : Text;
        fee : Tokens;
        memo : Nat64;
        from_subaccount : ?[Nat8];
        created_at_time : ?TimeStamp;
        amount : Tokens;
    };
    public type StandardRecord = { url : Text; name : Text };
    public type Symbol = { symbol : Text };
    public type TimeStamp = { timestamp_nanos : Nat64 };
    public type Tokens = { e8s : Nat64 };
    public type TransferArg = {
        to : Account;
        fee : ?Nat;
        memo : ?[Nat8];
        from_subaccount : ?[Nat8];
        created_at_time : ?Nat64;
        amount : Nat;
    };
    public type TransferArgs = {
        to : [Nat8];
        fee : Tokens;
        memo : Nat64;
        from_subaccount : ?[Nat8];
        created_at_time : ?TimeStamp;
        amount : Tokens;
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
    public type TransferError_1 = {
        #TxTooOld : { allowed_window_nanos : Nat64 };
        #BadFee : { expected_fee : Tokens };
        #TxDuplicate : { duplicate_of : Nat64 };
        #TxCreatedInFuture;
        #InsufficientFunds : { balance : Tokens };
    };
    public type TransferFee = { transfer_fee : Tokens };

    public type LedgerCanister = actor {
        account_balance : shared query BinaryAccountBalanceArgs -> async Tokens;
        account_balance_dfx : shared query AccountBalanceArgs -> async Tokens;
        archives : shared query () -> async Archives;
        decimals : shared query () -> async Decimals;
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
        name : shared query () -> async Name;
        query_blocks : shared query GetBlocksArgs -> async QueryBlocksResponse;
        send_dfx : shared SendArgs -> async Nat64;
        symbol : shared query () -> async Symbol;
        transfer : shared TransferArgs -> async Result_1;
        transfer_fee : shared query {} -> async TransferFee;
    };
};
