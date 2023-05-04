# Common Internet Computer Canisters

In this chapter, we will cover common Internet Computer canisters, namely the:

- [IC Management Canister](/common-internet-computer-canisters/ic-management-canister.html)
- [Ledger Canister](/common-internet-computer-canisters/icp-ledger-canister.html)
- [Cycles Minting Canister](/common-internet-computer-canisters/cycles-minting-canister.html)

## Local deployment of `ledger` and `cmc` canisters
To follow along and run the examples in this chapter, you need to [deploy local](/project-deployment.html) instances of the `ledger` and `cmc` canisters.

Make sure you are using an [identity for development](/project-deployment/identities-and-pem-files.html) and testing (optionally with encryption disabled for running commands without a password).

Using `dfx 0.14.0`, follow these steps:

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

The replica should start and a link to the replica dashboard should be shown in the terminal.

### Step 3

Open a new terminal window (leaving `dfx` running in the first terminal) and run:

```bash
dfx nns install --ledger-accounts $(dfx ledger account-id)
```

We are adding the `--ledger-accounts` flag with the default account of your identity as the argument. This way, the Ledger Canister is locally initialized with a certain amount of ICP to use for testing. 

This command should install many common canisters on your local replica. We will use two of those in this chapter and you should verify that they were installed in the last step. The output should contain (among other canisters)

```bash
nns-ledger            ryjl3-tyaaa-aaaaa-aaaba-cai
nns-cycles-minting    rkp4c-7iaaa-aaaaa-aaaca-cai
```

The canister ids don't change over time and are the same in local replicas and mainnet.

### Step 4
Verify the balance of the default account for your identity by running:

```bash
dfx ledger balance 
```

In `dfx 0.14.0` this should print `1000000000.00000000 ICP`. 


> **NOTE**  
> *[The IC Management Canister](/common-internet-computer-canisters/ic-management-canister.html) is not installed locally, because it's actually a 'pseudo-canister' that does not really exist with code and state on the IC.*
