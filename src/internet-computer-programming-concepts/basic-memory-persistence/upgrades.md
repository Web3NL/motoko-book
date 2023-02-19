# Upgrades
An [actor](/internet-computer-programming-concepts/actors.html) in Motoko is written in a source file (often called `main.mo`). The Motoko code is compiled into a [Wasm module](/internet-computer-programming-concepts/actors/actor-to-canister.html#code-compiling-and-wasm-modules) that is *installed* in a [canister](/internet-computer-programming-concepts/actors/actor-to-canister.html#canister) on the Internet Computer. The canister provides [main memory](/internet-computer-programming-concepts/basic-memory-persistence.html#canister-main-memory) for the actor to operate on and store its memory state. 

If we want to incrementally develop and evolve a Web3 Service, we need to be able to *upgrade* our actor code. 

New actor code results in a new Wasm module that is different from the older module that is running inside the canister. We need to replace the old module with the new one containing our upgraded actor. 

> **Immutable Microservice**  
> Some actors, may stay unchanged after their first installment in a canister. Small actors with one simple task are sometimes called *microservices* (that may be optionally *immutable* and not owned by anyone). A microservice consumes little resources (memory and cycles) and could operate for a long time without any upgrades.

## Reinstall and upgrade
There are two ways to *update* the Wasm module of an actor running in a canister. 

### Reinstall
When we have an actor Wasm module running in a canister, we could always reinstall that same actor module or a new actor module inside the same canister. Reinstalling always causes the actor to be 'reset'. Whether reinstalling the same actor Wasm module or a new one, the operation is the same as if installing for the first time.

**Reinstalling always wipes out the main memory of the canister and erases the state of the actor** 

### Upgrade
We could also choose to *upgrade* the Wasm module of an actor. Then:
- [Stable variables](/internet-computer-programming-concepts/basic-memory-persistence/stable-variables.html) are persisted
- The [actor interface](/internet-computer-programming-concepts/async-data/candid.html#actor-interfaces) is checked for [backwards compatibility](/internet-computer-programming-concepts/basic-memory-persistence.html#service-upgrades-and-sub-typing)
- [Pre and post upgrade hooks](/advanced-concepts/system-apis/preupgrade-postupgrade.html) are run before and after the upgrade

> **NOTE**  
> *Pre and post upgrade hooks could trap and lead to loss of canister data and thus are not considered best practice.*

## Upgrading and reinstalling in Motoko Playground and SDK
When we have an already running canister in [Motoko Playground](/getting-started.html) and we click `deploy` again, we are presented with the option to `upgrade` or `reinstall` (among other options).

The same functionality is provided when using the [SDK](/project-deployment.html).