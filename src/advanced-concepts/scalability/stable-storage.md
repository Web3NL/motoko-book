# Stable Storage

Every canister on the Internet Computer (IC) currently (May 2023) has 4GB of [working memory](/internet-computer-programming-concepts/basic-memory-persistence.html#canister-main-memory). This memory is wiped out each time the canister is [upgraded](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html).

On top of that, each canister currently (May 2023) gets an additional 48GB of storage space, which is called _stable storage_. This storage is persistent and is not wiped out during reinstallation or upgrade of a canister.

We can _directly_ use this memory by interacting with _experimental_ the [low-level API](/base-library/ic-apis/experimental/experimentalstablememory.html) from [base library](/base-library.html), but this is not ideal in many cases.

Work is underway for so called _stable data structures_ that are initiated and permanently stored in stable memory. See for example [this library](https://github.com/ZhenyaUsenko/motoko-hash-map) for a Stable Hashmap.

## Stable memory and upgrades

To preserve the [working memory](/internet-computer-programming-concepts/basic-memory-persistence.html#canister-main-memory) during [upgrades](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html), we may use [system functions](/advanced-concepts/system-apis/preupgrade-postupgrade.html) like `pre_upgrade` and `post_upgrade` to temporarily store the data in _stable storage_ during the upgrade and copied back over to the working memory after the upgrade.
