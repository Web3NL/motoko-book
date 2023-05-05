# Cycles Minting Canister

The Cycles Minting Canister (CMC) can mint cycles by converting [ICP into cycles](/project-deployment/cycles-and-icp.html). We can 'top up' a canister with [cycles](/project-deployment/cycles-and-icp.html) by sending ICP to the CMC and receiving cycles in return.

## Top up a canister locally

The easiest way to top up a canister with cycles is to use the `dfx` command line tool.

For this, we need a locally running test canister to top up. We can use the canister `motime` that we deployed in [this chapter](/project-deployment/local-deployment.html).

Assuming your canister name in `dfx.json` is `motime`, run

```bash
dfx canister status motime
```

This should print your [canister status](/project-deployment/canister-status.html). Please note your cycles balance.

Now top up the canister by running:

```bash
dfx ledger top-up $(dfx canister id motime) --amount 1
```

This command will automatically convert 1 ICP into cycles and deposit the cycles into your canister.

Now check your canister status again, to see that your cycles balance has increased.

## Top up a canister on mainnet

The same `dfx top-up` command can be used to top up a canister running on mainnet. For this to work, you must use an identity that holds ICP on the mainnet Ledger Canister.

### Step 1

Make sure you have a [identity set up](/project-deployment/identities-and-pem-files.html) and print its default account with:

```bash
dfx ledger account-id
```

Send real ICP to this account. Now check your balance with:

```bash
dfx ledger balance --network ic
```

### Step 2

Assuming you deployed `motime` on mainnet, check its cycle balance:

```bash
dfx canister status motime --network ic
```

And top it up with:

```bash
dfx ledger top-up $(dfx canister id motime) --amount 1 --network ic
```

Now check the cycle balance again to verify that it has increased.
