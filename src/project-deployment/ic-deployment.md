# IC Deployment

Now we have our [wallet canister](/project-deployment/cycles-wallet.html) setup on the Internet Computer (IC) with some [cycles](/project-deployment/cycles-and-icp.html), we are ready to deploy our first canister to the IC Mainnet.

Assuming the same project that we [deployed locally](/project-deployment/local-deployment.html), we can now use the same commands that we used to create, install and call a canister, only this time we add the `--network ic` flag to indicate to `dfx` that we want to execute these commands on the IC Mainnet.

> **NOTE**  
> _Using the `--network ic` will cost [cycles](/project-deployment/cycles-and-icp.html) that will be payed with your [cycles wallet](/project-deployment/cycles-wallet.html)_

## IC Mainnet Deployment

Make sure you have the same setup as in the [local deployment](/project-deployment/local-deployment.html) example.

### Create empty canister

First check your cycles balance on your cycles wallet by running `dfx wallet balance --network ic`. Now create a new canister on the IC Mainnet by running

```bash
dfx canister create motime --network ic
```

If successful, you should see a `canister_ids.json` file in the root of your project. This will contain the canister principal id of your new canister on the IC Mainnet.

> **NOTE**  
> _`dfx` will attempt to fuel the new canister with a default amount of cycles. In case your wallet does not have enough cycles to cover the default amount, you may choose to add the `--with-cycles` flag and specify a smaller amount._

Now, check you wallet balance again (by running `dfx wallet balance --network ic`) to confirm that the amount of cycles for the canister creation has been deducted.

Also, check the cycles balance of the new canister by running

```bash
dfx canister status motime --network ic
```

### Build Motoko code

Now we can compile the Motoko code into a [wasm file](/internet-computer-programming-concepts/actors/actor-to-canister.html#code-compiling-and-wasm-modules) by running

```bash
dfx build motime --network ic
```

If the build succeeds, the outputs will be stored in `.dfx/ic/canisters/motime/`. This folder contains, amongst other things, a `motime.wasm` file (the compiled Motoko actor) and a `motime.did` file (the [Interface Description](/internet-computer-programming-concepts/async-data/candid.html)).

### Installing the wasm in the canister

Now we can install the wasm module in the canister we created.

```bash
dfx canister install motime --network ic
```

If this succeeds, you now have a canister with an actor running on the IC Mainnet.

### Calling the canister

To interact with the running canister from the command line, run this command

```bash
dfx canister call motime hello motoko --network ic
```

The output should be `("Hello, motoko!")` indicating that the function inside `main.mo` was called successfully.

## `dfx deploy`

There is a command that combines the previous steps into one step.

```bash
dfx deploy motime --network ic
```

This command creates a canister (if it doesn't exist already), compiles the code and installs the wasm module in one step.

## Deleting a canister

To delete a canister and retrieve its cycles back to your cycles wallet, we need to first stop the canister by updating its [status](/project-deployment/canister-status.html).

```bash
dfx canister stop motime --network ic
```

This should stop the canister from running and will allow us now to delete it by running

```bash
dfx canister delete motime --network ic
```

This should delete the canister and send the remaining cycles back to your cycles wallet. Check this by running `dfx wallet balance --network ic`. Also check that the `canister_ids.json` file in the root of your project has been updated and the old canister principal has been removed.

> **NOTE**  
> _For a full overview of dfx commands, see the [official docs](https://internetcomputer.org/docs/current/references/cli-reference/)_
