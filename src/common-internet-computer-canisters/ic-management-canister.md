# IC Management Canister

To manage canisters programmatically, the Internet Computer (IC) provides a _management canister_. This canister, like any other canister, has a [Candid Interface](/internet-computer-programming-concepts/async-data/candid.html) and could be called by other canisters or [ingress messages].

In this chapter, we will only look at a subset of the interface. In particular, we will not cover Bitcoin, HTTP and cryptography related functionality and only focus on _canister management_.

| On this page                                                                                                             | Files                                                                                    |
| ------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------- |
| [Official full Candid Interface File](https://internetcomputer.org/assets/files/ic-12eac4f36bb9c2f60f72a9e195253eba.did) | [ic-management.did](_mo/ic-management/ic-management.did)                                 |
|                                                                                                                          |                                                                                          |
| [Subset of Interface in Motoko](#motoko-interface)                                                                       | [ic-management-interface.mo](_mo/ic-management/ic-management-interface.mo)               |
| [Importing](#import)                                                                                                     | [ic-management-import.mo](_mo/ic-management/ic-management-import.mo)                     |
| [Public function calls](#public-functions)                                                                               | [ic-management-public-functions.mo](_mo/ic-management/ic-management-public-functions.mo) |

## Motoko Interface

This is a subset of the interface as a [Motoko module]. It only includes _canister management_ related types and functions. It is available as [ic-management-interface.mo](_mo/ic-management/ic-management-interface.mo)

### Types

- `canister_id`
- `canister_settings`
- `definite_canister_settings`
- `wasm_module`
- `Self`

### Public functions

- [`create_canister`](#create-canister)
- [`install_code`](#install-code)
- [`start_canister`](#start-canister)
- [`canister_status`](#canister-status)
- [`deposit_cycles`](#deposit-cycles)
- [`update_settings`](#update-settings)
- [`stop_canister`](#stop-canister)
- [`uninstall_code`](#uninstall-code)
- [`delete_canister`](#delete-canister)

```motoko
{{#include _mo/ic-management/ic-management-interface.mo}}
```

## Import

We import the management canister by importing the interface file and referencing the `Self` type.

```motoko
{{#include _mo/ic-management/ic-management-import.mo}}
```

We can now reference the canister as `ic`.

We also imported `ExperimentalCycles` because some of our function calls require cycles to be added. 

## Public functions

### Create canister

```motoko
{{#include _mo/ic-management/ic-management-public-functions.mo:create_canister}}
```

### Install code

### Start canister

### Canister status

### Deposit cycles

### Update settings

### Stop canister

### Uninstall code

### Delete canister
