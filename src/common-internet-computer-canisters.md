# Common Internet Computer Canisters

In this chapter, we will cover common Internet Computer canisters, mainly:

- [IC Management Canister](/common-internet-computer-canisters/ic-management-canister.html)
- [Ledger Canister](/common-internet-computer-canisters/icp-ledger-canister.html)
- [Cycles Minting Canister](/common-internet-computer-canisters/cycles-minting-canister.html)

## Local deployment of `ledger` and `cmc` canisters

To deploy the Ledger Canister and Cycle Minting Canister [locally for testing](/project-deployment.html) (and running the test examples in this chapter), you need to deploy local instances of these canisters.

Using `dfx 0.14.0`

### Step 1

Open `.config/dfx/networks.json ` and change the `subnet_type` to system. The network configuration should look like this:

```json
{
  "local": {
    "bind": "127.0.0.1:8080",
    "type": "ephemeral",
    "replica": {
      "subnet_type": "system"
    }
  },
  "ic": {
    "providers": ["https://mainnet.dfinity.network"],
    "type": "persistent"
  }
}
```

Save and close the file.

### Step 2

Run `dfx` in any directory with the `--clean` flag:

```bash
dfx start --clean
```

The replica should start and a link to the dashboard should be shown in the terminal.

### Step 3

Open a new terminal window and run:

```bash
dfx nns install
```

This should install many common canisters on your local replica. We will use two of those in this chapter and you should verify that they were installed in the last step. Run:

```bash
nns-ledger            ryjl3-tyaaa-aaaaa-aaaba-cai
nns-cycles-minting    rkp4c-7iaaa-aaaaa-aaaca-cai
```

The canister ids are the same in local replicas and mainnet and don't change over time.

> **NOTE**  
> *[The IC Management Canister](/common-internet-computer-canisters/ic-management-canister.html) is not installed locally, because it's actually a 'pseudo-canister' that does not really exist with code and state on the IC.*
