# Cycle Minting Canister

| On this page                                       | Files                    |
| -------------------------------------------------- | ------------------------ |
| [Official full Candid Interface File]()            | [.did]()                 |
|                                                    |                          |
| [Subset of Interface in Motoko](#motoko-interface) | [-interface.mo]()        |
| [Importing](#import)                               | [-import.mo]()           |
| [Public function calls](#public-functions)         | [-public-functions.mo]() |

## Motoko Interface

<!-- This is a subset of the interface as a [Motoko module](/common-programming-concepts/modules.html). It only includes _icrc1_ related types and functions. It is available as [icp-ledger-interface.mo](_mo/icp-ledger/icp-ledger-interface.mo) -->

### Types

- `AccountIdentifier`
- `BlockIndex`
- `Cycles`
- `CyclesCanisterInitPayload`
- `ExchangeRateCanister`
- `IcpXdrConversionRateResponse`
- `NotifyCreateCanisterArg`
- `NotifyCreateCanisterResult`
- `NotifyError`
- `NotifyTopUpArg`
- `NotifyTopUpResult`
- `SubnetTypesToSubnetsResponse`

### Public functions

- [`get_icp_xdr_conversion_rate`](#get_icp_xdr_conversion_rate)
- [`get_subnet_types_to_subnets`](#get_subnet_types_to_subnets)
- [`notify_create_canister`](#notify_create_canister)
- [`notify_top_up`](#notify_top_up)

```motoko
{{#include _mo/cycle-minting/cycle-minting-interface.mo}}
```

## Import

We import the ICP ledger canister by importing the interface file and declaring an actor by principle `ryjl3-tyaaa-aaaaa-aaaba-cai` and type it as the `Self` type (which is declared in the interface).

```motoko
{{#include _mo/cycle-minting/cycle-minting-import.mo}}
```

We can now reference the icp ledger canister as `icp`.

## Public functions

### get_icp_xdr_conversion_rate

```motoko
get_icp_xdr_conversion_rate : shared query () -> async IcpXdrConversionRateResponse;
```

#### Example

```motoko
{{#include _mo/cycle-minting/cycle-minting-public-functions.mo:get_icp_xdr_conversion_rate}}
```

### get_subnet_types_to_subnets

```motoko
get_subnet_types_to_subnets : shared query () -> async SubnetTypesToSubnetsResponse;
```

#### Example

```motoko
{{#include _mo/cycle-minting/cycle-minting-public-functions.mo:get_subnet_types_to_subnets}}
```

### notify_create_canister

```motoko
notify_create_canister : shared NotifyCreateCanisterArg -> async NotifyCreateCanisterResult;
```

#### Example

```motoko
{{#include _mo/cycle-minting/cycle-minting-public-functions.mo:notify_create_canister}}
```

### notify_top_up

```motoko
notify_top_up : shared NotifyTopUpArg -> async NotifyTopUpResult;
```

#### Example

```motoko
{{#include _mo/cycle-minting/cycle-minting-public-functions.mo:notify_top_up}}
```
