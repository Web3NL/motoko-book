# Canister Status

Once we have a (locally) [running canister], we can interact with it from the command-line using `dfx`. We can [query call] the [management canister] for example to retrieve information about the status of a canister.

Once you have a (locally) running canister, you can run the following command to get its status (assuming our canister is called `motime` in `dfx.json`)

```bash
dfx canister status motime
```

This should return information about our canister, like

- **Controllers** A list of [principals] that control the canister
- **Memory size** The [working memory] used by the canister
- **Balance** The [cycles balance] of the canister
- **Module hash** The [wasm module hash] of the canister

The canister status response contains more information, which we didn't describe here. For a full overview of the canister status response and other functions we could call on the management canister, we need to consider the Candid interface and corresponding Motoko code for that interface.

In [chapter 8], we will look at how to call the management canister from within Motoko.
