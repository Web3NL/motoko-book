import SPEC "ic-management-interface";
import Cycles "mo:base/ExperimentalCycles";
import Debug "mo:base/Debug";

actor class IC({ wasm_module : [Nat8] }) {
    let IC = "aaaaa-aa";
    let ic = actor (IC) : SPEC.Self;

    // ANCHOR: create_canister
    var canisterPrincipal : ?Principal = null;

    func create_canister() : async* () {
        Cycles.add(10 ** 12);

        let newCanister = await ic.create_canister({ settings = null });

        canisterPrincipal := ?newCanister.canister_id;
    };
    // ANCHOR_END: create_canister

    // ANCHOR: install_code
    func install_code() : async* () {
        let principal : Principal = switch (canisterPrincipal) {
            case (?p) p;
            case (null) Debug.trap("no canister found");
        };

        await ic.install_code({
            arg = [0];
            wasm_module = [0];
            mode = #install;
            canister_id = principal;
        });
    };
    // ANCHOR_END: create_canister

    public func test() : async [Text] {
        await* create_canister();
        // await* install_code();

        [
            "create_canister",
            // "install_code",
        ];
    };

};
