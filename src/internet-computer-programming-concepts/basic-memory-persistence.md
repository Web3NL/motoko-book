# Basic Memory Persistence
Every [actor](/internet-computer-programming-concepts/actors.html) exposes a [public interface](/internet-computer-programming-concepts/async-data/candid.html#actor-interfaces). A deployed actor is sometimes referred to as a [*service*](/internet-computer-programming-concepts/async-data/candid.html#actor-interfaces). We interact with a service by calling the [public shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) of the underlying actor. 

The state of the actor can not change during a [query](/internet-computer-programming-concepts/actors.html#public-shared-query) function call. When we call a query function, we could pass in some data as arguments. This data could be used for a *computation*, but no data could be stored in the actor during the query call. 

The state of the actor may change during an [update](/internet-computer-programming-concepts/actors.html#public-shared-update) or [oneway](/internet-computer-programming-concepts/actors.html#public-shared-oneway) function call. Data provided as arguments (or data generated without arguments in the function itself) could be *stored* inside the actor.

## Canister main memory
Every actor running in a canister has access to a 4GB main 'working' memory (in Feb 2023). This is like the RAM memory. 

Code in actors directly acts on main memory:
- The values of (top-level) [mutable](/common-programming-concepts/mutability.html) and [immutable](/common-programming-concepts/variables.html) variables are stored in main memory. 
- [Public](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) and private functions in actors, that read and write data, do so from and to main memory.
- Imported [classes](/common-programming-concepts/objects-and-classes/classes.html) from [modules](/common-programming-concepts/modules.html) are instantiated as [objects](/common-programming-concepts/objects-and-classes/objects.html) in main memory. 
- [Imported functions](/common-programming-concepts/modules.html#public-functions-in-modules) from modules operate on main memory.

The same applies for any other imported [item](https://docs.google.com/spreadsheets/d/1IqgPi9I9EmoknJBzzxea_7dN9WRwtFle7Y99UURXC7Y/edit?usp=sharing) that is used inside an actor.  

### Memory Persistence across function calls
Consider the actor from our [previous example](/internet-computer-programming-concepts/actors.html#a-simple-actor) with only the mutable variable `latestComment` and the functions `readComment` and `writeComment`:
```motoko
{{#include _mo/basic-memory-persistence.mo:a}}
```

The mutable variable `latestComment` is stored in main memory. Calling the update function `writeComment` [*mutates*](/common-programming-concepts/mutability.html) the state of the mutable variable `latestComment` in main memory. 

For instance, we could call `writeComment` with an argument `"Motoko is great!"`. The variable `latestComment` will be set to that value in main memory. The mutable variable now has a *new state*. Another call to `readComment` would return the new value.  

 

### Service upgrades and main memory
Now, suppose we would like to *extend the functionality* of our service by adding another *public shared function* (like the [`deleteComment`](/internet-computer-programming-concepts/actors.html#a-simple-actor) function). We would need to write the function in Motoko, edit our original Motoko source file and go through the deployment process again. 

**The redeployment of our actor will wipe out the main memory of the actor!**

There are two main ways to upgrade the functionality of a service without resetting the *memory state* of the underlying actor. 

This chapter describes [*stable variables*](/internet-computer-programming-concepts/basic-memory-persistence/stable-variables.html) which are a way to *persist* the state of mutable variables across [*upgrades*](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html). Another way is to use [*stable memory*](/advanced-concepts/scalability/stable-storage.html), which will be discussed later in this book. 

### Service upgrades and sub-typing
When upgrading a service, we may also upgrade the [public interface](/internet-computer-programming-concepts/async-data/candid.html#actor-interfaces). This means that our [actor type](/internet-computer-programming-concepts/actors.html#actor-type) and [public interface description](/internet-computer-programming-concepts/async-data/candid.html#actor-interfaces) may change.

An older [client](/internet-computer-programming-concepts/actors/canister-calling.html) that is not aware of the change may still use the old interface. This can cause problems if for instance a client calls a function that no longer exists in the interface. This is called a *breaking change*, because it 'breaks' the older clients. 

To avoid breaking changes, we could extend the functionality of a service by using [sub-typing](/advanced-types/subtyping.html). This preserves the *old interface* rather than the memory state and is called *backwards compatibility*. This will be discussed [later](/advanced-types/subtyping.html) in this book. 
