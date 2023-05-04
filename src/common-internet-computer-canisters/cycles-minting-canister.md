# Cycles Minting Canister
The Cycles Minting Canister (CMC) can mint cycles by converting [ICP into cycles]. Every canister can top up itself by sending ICP to the CMC and receiving cycles in return.

For this to be possible, a canister must:
- hold ICP tokens (on a Ledger account controlled by its principle)
- send ICP tokens by calling the Ledger Canister
- notify the CMC of the transaction
- check its cycle balance

<!-- | On this page                                       | Files                    |
| -------------------------------------------------- | ------------------------ |
| [Official full Candid Interface File](https://github.com/dfinity/ic/blob/master/rs/nns/cmc/cmc.did)            | [cmc.did](_mo/cycle-minting/cmc.did)                 |
|                                                    |                          |
| [Subset of Interface in Motoko](#cmc-interface) | [cmc-interface.mo](_mo/cycle-minting/cycle-minting-interface.mo)        |
| [Importing](#import)                               | [cycle-minting-import.mo](_mo/cycle-minting/cycle-minting-import.mo)           |
| [Cycle Minting Test](#cycle-minting-test)         | [cycle-minting-public-functions.mo](_mo/cycle-minting/cycle-minting-test.mo) |

## CMC Interface

This is a subset of the interface as a [Motoko module](/common-programming-concepts/modules.html). It only includes the `notify_top_up` public function. It is available as [cmc-interface.mo](_mo/cycle-minting/cycle-minting-interface.mo)

### Types

- `BlockIndex`
- `Cycles`
- `NotifyError`
- `NotifyTopUpArg`
- `NotifyTopUpResult`

### Cycle Minting Test

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

### notify_top_up

```motoko
notify_top_up : shared NotifyTopUpArg -> async NotifyTopUpResult;
```

#### Example

```motoko
{{#include _mo/cycle-minting/cycle-minting-public-functions.mo:notify_top_up}}
``` -->
