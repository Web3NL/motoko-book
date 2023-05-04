import Interface "ic-management-interface";
import Cycles "mo:base/ExperimentalCycles";

actor {
    // The IC Management Canister ID
    let IC = "aaaaa-aa";
    let ic = actor(IC) : Interface.Self;
}