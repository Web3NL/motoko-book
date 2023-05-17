module {
    public type canister_id = Principal;

    public type User = {
        principal : Principal;
        username : Text;
        balance : Nat;
    };

    public type PCCWC = {
        settings : ?canister_settings;
        amount : ?Nat;
    };

    public type PTUC = {
        Canister_id : canister_id;
        amount : Nat;
    };

    public type canister_settings = {
        freezing_threshold : ?Nat;
        controllers : ?[Principal];
        memory_allocation : ?Nat;
        compute_allocation : ?Nat;
    };
    public type definite_canister_settings = {
        freezing_threshold : Nat;
        controllers : [Principal];
        memory_allocation : Nat;
        compute_allocation : Nat;
    };

    public type http_header = { value : Text; name : Text };
    public type http_response = {
        status : Nat;
        body : [Nat8];
        headers : [http_header];
    };
    public type wasm_module = [Nat8];
    public type ManagementCanister = actor {
        canister_status : shared { canister_id : canister_id } -> async {
            status : { #stopped; #stopping; #running };
            memory_size : Nat;
            cycles : Nat;
            settings : definite_canister_settings;
            idle_cycles_burned_per_day : Nat;
            module_hash : ?[Nat8];
        };
        create_canister : shared { settings : ?canister_settings } -> async {
            canister_id : canister_id;
        };
        delete_canister : shared { canister_id : canister_id } -> async ();
        deposit_cycles : shared { canister_id : canister_id } -> async ();
        http_request : shared {
            url : Text;
            method : { #get; #head; #post };
            max_response_bytes : ?Nat64;
            body : ?[Nat8];
            transform : ?{
                function : shared query {
                    context : [Nat8];
                    response : http_response;
                } -> async http_response;
                context : [Nat8];
            };
            headers : [http_header];
        } -> async http_response;
        install_code : shared {
            arg : [Nat8];
            wasm_module : wasm_module;
            mode : { #reinstall; #upgrade; #install };
            canister_id : canister_id;
        } -> async ();
        provisional_create_canister_with_cycles : shared {
            settings : ?canister_settings;
            amount : ?Nat;
        } -> async { canister_id : canister_id };
        provisional_top_up_canister : shared {
            canister_id : canister_id;
            amount : Nat;
        } -> async ();
        raw_rand : shared () -> async [Nat8];
        start_canister : shared { canister_id : canister_id } -> async ();
        stop_canister : shared { canister_id : canister_id } -> async ();
        uninstall_code : shared { canister_id : canister_id } -> async ();
        update_settings : shared {
            canister_id : Principal;
            settings : canister_settings;
        } -> async ();
    };
};
