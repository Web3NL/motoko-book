# Canister Status

Once we have a (locally) [running canister](/project-deployment/local-deployment.html), we can interact with it from the command-line using `dfx`. We can [query call](/internet-computer-programming-concepts/actors.html#public-shared-query) the [management canister](/common-internet-computer-canisters/ic-management-canister.html) for example to retrieve information about the status of a canister.

Once you have a (locally) running canister, you can run the following command to get its status (assuming our canister is called `motime` in `dfx.json`)

```bash
dfx canister status motime
```

This should return information about our canister, like

- **Controllers** A list of [principals](/internet-computer-programming-concepts/principals-and-authentication.html#principals-and-authentication) that control the canister
- **Memory size** The [working memory](/internet-computer-programming-concepts/basic-memory-persistence.html#canister-main-memory) used by the canister
- **Balance** The [cycles balance](/project-deployment/cycles-and-icp.html) of the canister
- **Module hash** The [wasm module hash](/internet-computer-programming-concepts/actors/actor-to-canister.html#code-compiling-and-wasm-modules) of the canister

The canister status response contains more information, which we didn't describe here. For a full overview of the canister status response and other functions we could call on the [management canister](/common-internet-computer-canisters/ic-management-canister.html), we need to consider the [Candid interface](/internet-computer-programming-concepts/async-data/candid.html) and corresponding Motoko code for that interface.

In [chapter 8](/common-internet-computer-canisters.html), we will look at how to call the [management canister](/common-internet-computer-canisters/ic-management-canister.html) from within Motoko.
