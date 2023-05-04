import Interface "icp-ledger-interface";

actor {
    // The Ledger Canister ID
    let ICP = "ryjl3-tyaaa-aaaaa-aaaba-cai";
    let icp = actor(ICP) : Interface.Self;
}