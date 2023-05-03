import SPEC "icp-ledger-interface";

actor {
    let ICP = "ryjl3-tyaaa-aaaaa-aaaba-cai";
    let icp = actor(ICP) : SPEC.Self;
}