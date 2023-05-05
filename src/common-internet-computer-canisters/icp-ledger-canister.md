# ICP Ledger

ICP tokens are held on a canister that implements a token ledger. We refer to it as the Ledger Canister. This ICP Ledger Canister exposes a [Candid Interface](/internet-computer-programming-concepts/async-data/candid.html) with ledger functionality, like sending tokens and querying balances.

We will only focus on the `icrc1` part of the interface. The full interface is available as a file [here](_mo/icp-ledger/icp-ledger.did) and [online in a 'ledger explorer'](https://dashboard.internetcomputer.org/canister/ryjl3-tyaaa-aaaaa-aaaba-cai).

For detailed information about the `icrc1` standard, you may review [chapter 9](/internet-computer-standards/icrc1.html).

| On this page                                                                                                       | Files                                                                           |
| ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------- |
| [Official full Candid Interface File](https://dashboard.internetcomputer.org/canister/ryjl3-tyaaa-aaaaa-aaaba-cai) | [ic-management.did](_mo/icp-ledger/icp-ledger.did)                              |
|                                                                                                                    |                                                                                 |
| [Subset of Interface in Motoko](#motoko-interface)                                                                 | [icp-ledger-interface.mo](_mo/icp-ledger/icp-ledger-interface.mo)               |
| [Importing](#import)                                                                                               | [icp-ledger-import.mo](_mo/icp-ledger/icp-ledger-import.mo)                     |
| [Public function calls](#public-functions)                                                                         | [icp-ledger-public-functions.mo](_mo/icp-ledger/icp-ledger-public-functions.mo) |

## Motoko Interface

This is a subset of the interface as a [Motoko module](/common-programming-concepts/modules.html). It only includes `icrc1` related types and functions. It is available as [icp-ledger-interface.mo](_mo/icp-ledger/icp-ledger-interface.mo)

Note, that the types are slightly different from the icrc1 standard, but the functions are the same.

### Types

- `Account`
- `MetadataValue`
- `Result`
- `StandardRecord`
- `TransferArg`
- `TransferError`
- `Self`

### Public functions

- [`icrc1_name`](#icrc1_name)
- [`icrc1_symbol`](#icrc1_symbol)
- [`icrc1_decimals`](#icrc1_decimals)
- [`icrc1_fee`](#icrc1_fee)

- [`icrc1_metadata`](#icrc1_metadata)
- [`icrc1_minting_account`](#icrc1_minting_account)
- [`icrc1_supported_standards`](#icrc1_supported_standards)
- [`icrc1_total_supply`](#icrc1_total_supply)

- [`icrc1_balance_of`](#icrc1_balance_of)
- [`icrc1_transfer`](#icrc1_transfer)

```motoko
{{#include _mo/icp-ledger/icp-ledger-interface.mo}}
```

## Import

We import the ICP ledger canister by importing the interface file and declaring an actor by principle `ryjl3-tyaaa-aaaaa-aaaba-cai` and type it as the `Self` type (which is declared in the interface).

> **NOTE**  
> _If you are testing locally, you should have the Ledger Canister [installed locally](/common-internet-computer-canisters.html)._

```motoko
{{#include _mo/icp-ledger/icp-ledger-import.mo}}
```

We can now reference the icp ledger canister as `icp`.

## Public functions

These functions are available in [`icp-ledger-public-functions.mo`](_mo/icp-ledger/icp-ledger-public-functions.mo) together with a test function. To test these functions, please read the [test](#test) section.

### icrc1_name

```motoko
icrc1_name : shared query () -> async Text;
```

#### Example

```motoko
{{#include _mo/icp-ledger/icp-ledger-public-functions.mo:name}}
```

### icrc1_symbol

```motoko
icrc1_symbol : shared query () -> async Text;
```

#### Example

```motoko
{{#include _mo/icp-ledger/icp-ledger-public-functions.mo:symbol}}
```

### icrc1_decimals

```motoko
icrc1_decimals : shared query () -> async Nat8;
```

#### Example

```motoko
{{#include _mo/icp-ledger/icp-ledger-public-functions.mo:decimals}}
```

### icrc1_fee

```motoko
icrc1_fee : shared query () -> async Nat;
```

#### Example

```motoko
{{#include _mo/icp-ledger/icp-ledger-public-functions.mo:fee}}
```

### icrc1_metadata

```motoko
icrc1_metadata : shared query () -> async [(Text, MetadataValue)];
```

#### Example

```motoko
{{#include _mo/icp-ledger/icp-ledger-public-functions.mo:metadata}}
```

### icrc1_minting_account

```motoko
icrc1_minting_account : shared query () -> async ?Account;
```

#### Example

```motoko
{{#include _mo/icp-ledger/icp-ledger-public-functions.mo:minting_account}}
```

### icrc1_supported_standards

```motoko
icrc1_supported_standards : shared query () -> async [StandardRecord];
```

#### Example

```motoko
{{#include _mo/icp-ledger/icp-ledger-public-functions.mo:supported_standards}}
```

### icrc1_total_supply

```motoko
icrc1_total_supply : shared query () -> async Nat;
```

#### Example

```motoko
{{#include _mo/icp-ledger/icp-ledger-public-functions.mo:total_supply}}
```

### icrc1_balance_of

```motoko
icrc1_balance_of : shared query Account -> async Nat;
```

#### Example

```motoko
{{#include _mo/icp-ledger/icp-ledger-public-functions.mo:balance_of}}
```

### icrc1_transfer

```motoko
icrc1_transfer : shared TransferArg -> async Result;
```

#### Example

```motoko
{{#include _mo/icp-ledger/icp-ledger-public-functions.mo:transfer}}
```

## Test

Before we can run the test, we have to

- have a [local instance](/common-internet-computer-canisters.html) of the Ledger Canister
- [deploy](/project-deployment/local-deployment.html) the [`icp-ledger-public-functions.mo`](_mo/icp-ledger/icp-ledger-public-functions.mo) actor locally and name the canister `icp-ledger` in your `dfx.json`.
- transfer some ICP to the canister

If you followed the steps for [local ledger canister deployment](/common-internet-computer-canisters.html), you should have ICP on the default account of your identity. Then you can send ICP to your canister with these steps.

### Step 1

First export your canister id to an environment variable. Assuming your canister name in `dfx.json` is `icp-ledger` run:

```bash
export CANISTER_ID=$(dfx canister id icp-ledger)
```

### Step 2

Then export your the default account id belonging to your canister principal by using the `dfx ledger account-id` command with the `--of-principal` flag:

```bash
export ACCOUNT_ID=$(dfx ledger account-id --of-principal $CANISTER_ID)
```

### Step 3

Check the ICP balance on your local Ledger of the default accounts of your identity and canister id with these commands.

Identity balance:

```bash
dfx ledger balance
```

Canister balance:

```bash
dfx ledger balance $ACCOUNT_ID
```

### Step 4

Finally, send ICP to your canister with the `dfx ledger transfer` command:

```bash
dfx ledger transfer --amount 1 $ACCOUNT_ID --memo 0
```

Now check your balances again to check the transfer.

### Step 5

To test all the Ledger public functions, we run this test. (Available in [icp-ledger-public-functions.mo](_mo/icp-ledger/icp-ledger-public-functions.mo))

For testing the `icrc1_balance_of` function, you need to replace the principal with your own principal. 

For the `icrc1_transfer` function, we use a specific subaccount by making a 32 byte [Nat8] array with the first byte set to `1`.
  
```motoko
{{#include _mo/icp-ledger/icp-ledger-public-functions.mo:test}}
```

After running this test locally, you should check your canister balance again to verify that the `icrc1_transfer` function was successful and thus the whole test was executed. 
