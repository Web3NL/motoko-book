import Interface "ic-management-interface";
import Cycles "mo:base/ExperimentalCycles";

actor {
    let IC = "aaaaa-aa";
    let ic = actor(IC) : Interface.Self;
}