# Cycle Minting Canister

| On this page                                                                                                             | Files                                                                                    |
| ------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------- |
| [Official full Candid Interface File]() | [.did]()                                 |
|                                                                                                                          |                                                                                          |
| [Subset of Interface in Motoko](#motoko-interface)                                                                       | [-interface.mo]()               |
| [Importing](#import)                                                                                                     | [-import.mo]()                     |
| [Public function calls](#public-functions)                                                                               | [-public-functions.mo]() |

## Motoko Interface

<!-- This is a subset of the interface as a [Motoko module](/common-programming-concepts/modules.html). It only includes _icrc1_ related types and functions. It is available as [icp-ledger-interface.mo](_mo/icp-ledger/icp-ledger-interface.mo) -->

### Types

- 

### Public functions

- []


```motoko
{{#include}}
```

## Import

We import the ICP ledger canister by importing the interface file and declaring an actor by principle `ryjl3-tyaaa-aaaaa-aaaba-cai` and type it as the `Self` type (which is declared in the interface).

```motoko
{{#include }}
```

We can now reference the icp ledger canister as `icp`.

## Public functions

### icrc1_transfer
```motoko
icrc1_transfer : shared TransferArg -> async Result;
```

#### Example

```motoko
{{#include _mo/icp-ledger/icp-ledger-public-functions.mo:transfer}}
```