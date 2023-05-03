import SPEC "ic-management-interface";

import Cycles "mo:base/ExperimentalCycles";
import Principal "mo:base/Principal";
import Error "mo:base/Error";

actor ICManagement {
    let IC = "aaaaa-aa";
    let ic = actor (IC) : SPEC.Self;

    // ANCHOR: create_canister
    var canister_id : Principal = Principal.fromActor(ic);

    func create_canister() : async* () {
        Cycles.add(10 ** 12);

        let newCanister = await ic.create_canister({ settings = null });

        canister_id := newCanister.canister_id;
    };
    // ANCHOR_END: create_canister

    // ANCHOR: canister_status
    var controllers : [Principal] = [];

    func canister_status() : async* () {
        let canisterStatus = await ic.canister_status({ canister_id });

        controllers := canisterStatus.settings.controllers;
    };
    // ANCHOR_END: canister_status

    // ANCHOR: deposit_cycles
    func deposit_cycles() : async* () {
        Cycles.add(10 ** 12);

        await ic.deposit_cycles({ canister_id });
    };
    // ANCHOR_END: deposit_cycles

    // ANCHOR: update_settings
    func update_settings() : async* () {
        let settings : SPEC.canister_settings = {
            controllers = ?controllers;
            compute_allocation = null;
            memory_allocation = null;
            freezing_threshold = ?(60 * 60 * 24 * 7);
        };

        await ic.update_settings({ canister_id; settings });
    };
    // ANCHOR_END: update_settings

    // ANCHOR: uninstall_code
    func uninstall_code() : async* () {
        await ic.uninstall_code({ canister_id });
    };
    // ANCHOR_END: uninstall_code

    // ANCHOR: stop_canister
    func stop_canister() : async* () {
        await ic.stop_canister({ canister_id });
    };
    // ANCHOR_END: stop_canister

    // ANCHOR: start_canister
    func start_canister() : async* () {
        await ic.start_canister({ canister_id });
    };
    // ANCHOR_END: start_canister

        // ANCHOR: delete_canister
    func delete_canister() : async* () {
        await ic.delete_canister({ canister_id });
    };
    // ANCHOR_END: delete_canister

    // ANCHOR: install_code
    // func install_code() : async* () {
    //     let principal : Principal = switch (canisterPrincipal) {
    //         case (?p) p;
    //         case (null) Debug.trap("no canister found");
    //     };

    //     await ic.install_code({
    //         arg = [0];
    //         wasm_module = [0];
    //         mode = #install;
    //         canister_id = principal;
    //     });
    // };
    // ANCHOR_END: create_canister

    public func test() : async { #OK; #ERR : Text } {
        try {
            await* create_canister();
            await* canister_status();
            
            await* deposit_cycles();
            await* update_settings();
            await* uninstall_code();

            await* stop_canister();
            await* start_canister();
            await* stop_canister();

            await* delete_canister();
            // await* install_code();

            #OK;
        } catch (e) {
            #ERR(Error.message(e));
        };

    };

};
