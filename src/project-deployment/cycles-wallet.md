# Cycles Wallet

Until now, we have been using the [_default identity_](/project-deployment/identities-and-pem-files.html#default-identity-in-dfx) in `dfx` to deploy a project [_locally_](/project-deployment/local-deployment.html) on our machine. When we deployed our project, `dfx` automatically created a local _cycles wallet_ with some test cycles to deploy and run canisters locally.

When we want to create and deploy canisters on the Internet Computer Mainnet, we need _real_ cycles. For that we can use a _cycles wallet canister_.

We recommend to make use of several services that work together to create and manage your cycles wallet:

- [Internet Identity](//identity.ic0.app)
- [NNS Dapp](//nns.ic0.app)
- `dfx` [developer identity](/project-deployment/identities-and-pem-files.html)

## Step 1: Create an Internet Identity anchor

Internet Identity (II) is outside the scope of this book. For more info on how to securely create an II Anchor and use it, please refer [to this page](https://internetcomputer.org/docs/current/tokenomics/identity-auth/auth-how-to#create-an-identity-anchor).

## Step 2: Transfer ICP to your NNS Dapp Wallet

Once you have an II Anchor, you can use it to log in into the [NNS Dapp](//nns.ic0.app). The NNS Dapp features an ICP Wallet to securely store ICP tokens. To obtain ICP tokens, one typically purchases them on an exchange like Binance or Coinbase and then transfers them from an exchange into the NNS Dapp wallet.

We will not cover the steps for obtaining ICP tokens and will assume that you have some ICP in your NNS Dapp.

## Step 3: Create a new canister in the NNS Dapp

In the NNS Dapp, select the 'My Canisters' tab. There you have the option to create a new canister.

A new canister needs an initial amount of cycles. When creating a new canister, you may choose an amount of ICP to convert into cycles to fuel the canister. The conversion rate of ICP / Cycles is [determined](/project-deployment/cycles-and-icp.html#converting-icp-into-cycles) by the real world price of ICP. When you choose an amount of ICP, the corresponding amount of cycles you get is shown. Currently, April 2023, the minimum amount of cycles for creating a new canister is 2T cycles plus a small fee.

Choose an amount of your liking and create a new canister. You should now see your canister in the NNS Dapp. It should say that your canister is using 0 MB of storage, which is correct since your canister is empty and has no [wasm module installed](/internet-computer-programming-concepts/actors/actor-to-canister.html#code-compiling-and-wasm-modules).

We will use this canister to install a cycles wallet.

## Step 4: Add your developer identity as a controller of the canister

Now [create a developer identity](/project-deployment/identities-and-pem-files.html) on your computer using `dfx`. If you plan on using this identity with significant amounts of cycles and/or ICP, you should back it up first.

Now get your developer identity principal by [selecting](/project-deployment/identities-and-pem-files.html#managing-identities) your identity using `dfx identity use` and running

```bash
dfx identity get-principal
```

`dfx` should print out the [_textual representation_](/internet-computer-programming-concepts/principals-and-authentication.html#principals-and-authentication) of your principal. Copy this principal and head back to your NNS Dapp.

Click on your canister and you should see one 'controller' of your canister. This controller is the principal tied to your Internet Identity. We want to add the developer identity from `dfx` to the list of controllers of the canister. To do so, click on 'add controller' and paste your developer identity principal.

You should now see two principals that control your new canister.

## Step 5: Deploy a cycles wallet to the canister

Now your developer identity has control over the new canister, we can actually install [wasm modules](/internet-computer-programming-concepts/actors/actor-to-canister.html#code-compiling-and-wasm-modules) on it. In this case, we will install a cycles wallet wasm module in the canister using `dfx`. To do this, you need to copy the principal of your canister from the NNS Dapp and run

```bash
dfx identity deploy-wallet CANISTER_PRINCIPAL --network ic
```

where 'CANISTER_PRINCIPAL' is the principal of your newly created canister in NNS Dapp.

If the command is successful, you should now have a cycles wallet on the IC Mainnet which is controlled by two principals, namely your:

- Developer Identity
- Internet Identity

`dfx` will add a `wallets.json` file in your identity folder at

```bash
.config/dfx/identity/IDENTITY/wallets.json
```

where 'IDENTITY' is your developer identity that you used during the deployment of the cycles wallet. This file associates your cycles wallet with your developer identity. To check this you can:

- Open the file and check whether the canister id in `wallets.json` matches the canister principal in NNS Dapp.
- Run `dfx identity get-wallet --network ic` which should print out the same canister principal

Additionally you may run

```bash
dfx wallet balance --network ic
```

which should retrieve the cycles balance of what is now your cycles wallet canister. This amount should correspond to the initial amount you converted in step 3.

## Using your cycles wallet

Since your cycles wallet on the mainnet is now linked to your developer identity, `dfx` will use it whenever you run commands with the `--network ic` flag. In particular, when you deploy a new canister to the IC Mainnet, your cycles wallet will be used to fuel the canister with cycles. It is therefore important to have a sufficient balance of cycles in your cycles wallet.

You can fuel your cycles wallet with additional cycles by:

- Using the 'add cycles' function in the NNS Dapp. You will need ICP in your NNS Dapp Wallet for that.
- Manually 'top up' your cycles canister wallet using `dfx`. You need ICP on an account in the [ICP Ledger](/common-internet-computer-canisters/ledger.html) controlled by your developer principle for that.
- Programmatically send ICP to the [_cycles minting canister_](/common-internet-computer-canisters/cycles-minting-canister.html) and request a cycles top-up to your canister.
