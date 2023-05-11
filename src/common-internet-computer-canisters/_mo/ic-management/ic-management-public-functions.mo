import Interface "ic-management-interface";

import Cycles "mo:base/ExperimentalCycles";
import Principal "mo:base/Principal";
import Error "mo:base/Error";

actor class ICManagement({wasm_module : [Nat8]}) {
    // The IC Management Canister ID
    let IC = "aaaaa-aa";
    let ic = actor (IC) : Interface.Self;

    // ANCHOR: create_canister
    var canister_principal : Text = "";

    func create_canister() : async* () {
        Cycles.add(10 ** 12);

        let newCanister = await ic.create_canister({ settings = null });

        canister_principal := Principal.toText(newCanister.canister_id);
    };
    // ANCHOR_END: create_canister

    // ANCHOR: install_code
    func install_code() : async* () {
        let canister_id = Principal.fromText(canister_principal);

        await ic.install_code({
            canister_id;
            wasm_module;
            arg = [];
            mode = #install;
        });
    };
    // ANCHOR_END: install_code

    // ANCHOR: canister_status
    var controllers : [Principal] = [];

    func canister_status() : async* () {
        let canister_id = Principal.fromText(canister_principal);

        let canisterStatus = await ic.canister_status({ canister_id });

        controllers := canisterStatus.settings.controllers;
    };
    // ANCHOR_END: canister_status

    // ANCHOR: deposit_cycles
    func deposit_cycles() : async* () {
        Cycles.add(10 ** 12);

        let canister_id = Principal.fromText(canister_principal);

        await ic.deposit_cycles({ canister_id });
    };
    // ANCHOR_END: deposit_cycles

    // ANCHOR: update_settings
    func update_settings() : async* () {
        let settings : Interface.canister_settings = {
            controllers = ?controllers;
            compute_allocation = null;
            memory_allocation = null;
            freezing_threshold = ?(60 * 60 * 24 * 7);
        };

        let canister_id = Principal.fromText(canister_principal);

        await ic.update_settings({ canister_id; settings });
    };
    // ANCHOR_END: update_settings

    // ANCHOR: uninstall_code
    func uninstall_code() : async* () {
        let canister_id = Principal.fromText(canister_principal);

        await ic.uninstall_code({ canister_id });
    };
    // ANCHOR_END: uninstall_code

    // ANCHOR: stop_canister
    func stop_canister() : async* () {
        let canister_id = Principal.fromText(canister_principal);

        await ic.stop_canister({ canister_id });
    };
    // ANCHOR_END: stop_canister

    // ANCHOR: start_canister
    func start_canister() : async* () {
        let canister_id = Principal.fromText(canister_principal);

        await ic.start_canister({ canister_id });
    };
    // ANCHOR_END: start_canister

    // ANCHOR: delete_canister
    func delete_canister() : async* () {
        let canister_id = Principal.fromText(canister_principal);

        await ic.delete_canister({ canister_id });
    };
    // ANCHOR_END: delete_canister

    // ANCHOR: test
    public func ic_management_canister_test() : async { #OK; #ERR : Text } {
        try {
            await* create_canister();
            await* install_code();
            await* canister_status();

            await* deposit_cycles();
            await* update_settings();
            await* uninstall_code();

            await* stop_canister();
            await* start_canister();
            await* stop_canister();

            await* delete_canister();

            #OK;
        } catch (e) {
            #ERR(Error.message(e));
        };
    };
    // ANCHOR_END: test
};
