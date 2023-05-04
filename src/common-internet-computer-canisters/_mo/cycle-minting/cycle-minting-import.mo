import SPEC "cycle-minting-interface";

actor {
    let ICP = "rkp4c-7iaaa-aaaaa-aaaca-cai";
    let icp = actor(ICP) : SPEC.Self;
}