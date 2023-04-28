import SPEC "ic-management-interface";

actor {
    let IC = "aaaaa-aa";
    let ic = actor(IC) : SPEC.Self;
}