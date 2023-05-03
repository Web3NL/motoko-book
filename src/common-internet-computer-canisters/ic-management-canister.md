# IC Management Canister

The Internet Computer (IC) provides a _management canister_ to manage canisters programmatically. This canister, like any other canister, has a [Candid Interface](/internet-computer-programming-concepts/async-data/candid.html) and could be called by other canisters or [ingress messages].

In this chapter, we will only look at a subset of the interface. In particular, we will not cover Bitcoin, HTTP and cryptography related functionality and only focus on _canister management_.

| On this page                                                                                                             | Files                                                                                    |
| ------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------- |
| [Official full Candid Interface File](https://internetcomputer.org/assets/files/ic-12eac4f36bb9c2f60f72a9e195253eba.did) | [ic-management.did](_mo/ic-management/ic-management.did)                                 |
|                                                                                                                          |                                                                                          |
| [Subset of Interface in Motoko](#motoko-interface)                                                                       | [ic-management-interface.mo](_mo/ic-management/ic-management-interface.mo)               |
| [Importing](#import)                                                                                                     | [ic-management-import.mo](_mo/ic-management/ic-management-import.mo)                     |
| [Public function calls](#public-functions)                                                                               | [ic-management-public-functions.mo](_mo/ic-management/ic-management-public-functions.mo) |

## Motoko Interface

This is a subset of the interface as a [Motoko module](/common-programming-concepts/modules.html). It only includes _canister management_ related types and functions. It is available as [ic-management-interface.mo](_mo/ic-management/ic-management-interface.mo)

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

We import the management canister by importing the interface file and declaring an actor by principle `aaaaa-aa` and type it as the `Self` (which is declared in the interface).

```motoko
{{#include _mo/ic-management/ic-management-import.mo}}
```

We can now reference the canister as `ic`.

We also imported `ExperimentalCycles` because some of our function calls require cycles to be added.

## Public functions

The source file with function calls is [available here](_mo/ic-management/ic-management-public-functions.mo) including a test to run all functions. You can deploy it [locally](/project-deployment/local-deployment.html) for testing. 

### Create canister

To create a new canister, we call the `create_canister` function.

```motoko
create_canister : shared { settings : ?canister_settings } -> async {
    canister_id : canister_id;
};
```

The function may take a optional `canisters_settings` record to set initial settings for the canister, but this argument may be `null`.

The function returns a record containing the `Principal` of the newly created canister.

> **NOTE**  
> _To create a new canister, you must add cycles to the call using the `ExperimentalCycles` module_

#### Example

```motoko
{{#include _mo/ic-management/ic-management-public-functions.mo:create_canister}}
```

### Canister status

To get the current status of a canister we call `canister_status`. We only provide a simple record with a `canister_id` (principal) of the canister we are interested in. Only _controllers_ of the canister can ask for its settings.

```motoko
canister_status : shared { canister_id : canister_id } -> async {
    status : { #stopped; #stopping; #running };
    memory_size : Nat;
    cycles : Nat;
    settings : definite_canister_settings;
    idle_cycles_burned_per_day : Nat;
    module_hash : ?[Nat8];
};
```

The function returns a record containing the `status` of the canister, the `memory_size` in bytes, the `cycles` balance, a `definite_canister_settings` with its current settings, the `idle_cycles_burned_per_day` which indicates the average cycle consumption of the canister and a `module_hash` if the canister has a wasm module installed on it.

#### Example

```motoko
{{#include _mo/ic-management/ic-management-public-functions.mo:canister_status}}
```

### Deposit cycles

To deposit cycles into a canister we call `deposit_cycles`. Anyone can call this function.

We only need to provide a record with the `canister_id` of the canister we want to deposit into.

```motoko
deposit_cycles : shared { canister_id : canister_id } -> async ();
```

> **NOTE**  
> _To deposit cycles into a canister, you must add cycles to the call using the `ExperimentalCycles` module_

#### Example

```motoko
{{#include _mo/ic-management/ic-management-public-functions.mo:deposit_cycles}}
```

### Update settings

To update the settings of a canister, we call `update_settings` and provide the `canister_id` together with the new `canister_settings`.

```motoko
update_settings : shared {
      canister_id : Principal;
      settings : canister_settings;
} -> async ();
```

#### Example

```motoko
{{#include _mo/ic-management/ic-management-public-functions.mo:update_settings}}
```

### Uninstall code

To _uninstall_ (remove) the wasm module from a canister we call `uninstall_code` with a record containing the `canister_id`. Only controllers of the canister can call this function.

```motoko
uninstall_code : shared { canister_id : canister_id } -> async ();
```

#### Example

```motoko
{{#include _mo/ic-management/ic-management-public-functions.mo:uninstall_code}}
```

### Stop canister

To _stop_ a running canister we call `stop_canister` with a record containing the `canister_id`. Only controllers of the canister can call this function.

```motoko
stop_canister : shared { canister_id : canister_id } -> async ();
```

#### Example

```motoko
{{#include _mo/ic-management/ic-management-public-functions.mo:stop_canister}}
```

### Start canister

To _start_ a stopped canister we call `start_canister` with a record containing the `canister_id`. Only controllers of the canister can call this function.

```motoko
start_canister : shared { canister_id : canister_id } -> async ();
```

#### Example

```motoko
{{#include _mo/ic-management/ic-management-public-functions.mo:start_canister}}
```

### Delete canister

To _delete_ a stopped canister we call `delete_canister` with a record containing the `canister_id`. Only stopped canisters can be deleted and only controllers of the canister can call this function.

```motoko
delete_canister : shared { canister_id : canister_id } -> async ();
```

#### Example

```motoko
{{#include _mo/ic-management/ic-management-public-functions.mo:delete_canister}}
```

### Install code

To install a wasm module in a canister, we call `install_code`. Only _controllers_ of a canister can call this function.

We need to provide a wasm module install arguments as `[Nat8]` arrays. We also pick a [mode](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html#reinstall-and-upgrade) to indicate whether we are freshly installing or [upgrading](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html) the canister. And finally, we provide the _canister id_ (principal) that we want to install code into.

```motoko
install_code : shared {
    arg : [Nat8];
    wasm_module : wasm_module;
    mode : { #reinstall; #upgrade; #install };
    canister_id : canister_id;
} -> async ();
```

This function is _atomic_ meaning that it either succeeds and returns `()` or it has no effect.
