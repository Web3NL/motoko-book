# IC Management Canister

To manage canisters programmatically on the Internet Computer (IC), the system provides the _management canister_. This canister, like any other canister, has a [Candid Interface](/internet-computer-programming-concepts/async-data/candid.html) and could be called by other canisters or ingress messages.

Check out the official [Candid Interface Description](https://internetcomputer.org/assets/files/ic-12eac4f36bb9c2f60f72a9e195253eba.did) for a full reference of the interface.

We will only look at a subset of its interface in this chapter. In particular, we will not cover Bitcoin, HTTP and cryptography related functionality and only focus on _canister management_.

## Motoko Interface

This is the subset of the interface we will cover. It is available as [ic-management-interface.mo](_mo/ic-management-interface.mo)

```motoko
{{#include _mo/ic-management-interface.mo}}
```

## Import

```motoko
{{#include _mo/ic-management.mo}}
```

## Public Interface

### Create canister

### Install code

### Start canister

### Canister status

### Deposit cycles

### Update settings

### Stop canister

### Uninstall code

### Delete canister
