# Basic Memory Persistence

Every [actor](/internet-computer-programming-concepts/actors.html) exposes a [public interface](/internet-computer-programming-concepts/async-data/candid.html#actor-interfaces). A deployed actor is sometimes referred to as a [_service_](/internet-computer-programming-concepts/async-data/candid.html#actor-interfaces). We interact with a service by calling the [public shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) of the underlying actor.

The state of the actor can not change during a [query](/internet-computer-programming-concepts/actors.html#public-shared-query) function call. When we call a query function, we could pass in some data as arguments. This data could be used for a _computation_, but no data could be stored in the actor during the query call.

The state of the actor may change during an [update](/internet-computer-programming-concepts/actors.html#public-shared-update) or [oneway](/internet-computer-programming-concepts/actors.html#public-shared-oneway) function call. Data provided as arguments (or data generated without arguments in the function itself) could be _stored_ inside the actor.

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
actor {
  private var latestComment = "";

  public shared query func readComment() : async Text {
    latestComment;
  };

  public shared func writeComment(comment : Text) : async () {
    latestComment := comment;
  };
};
```

The mutable variable `latestComment` is stored in main memory. Calling the update function `writeComment` [_mutates_](/common-programming-concepts/mutability.html) the state of the mutable variable `latestComment` in main memory.

For instance, we could call `writeComment` with an argument `"Motoko is great!"`. The variable `latestComment` will be set to that value in main memory. The mutable variable now has a _new state_. Another call to `readComment` would return the new value.

### Service upgrades and main memory

Now, suppose we would like to _extend the functionality_ of our service by adding another _public shared function_ (like the [`deleteComment`](/internet-computer-programming-concepts/actors.html#a-simple-actor) function). We would need to write the function in Motoko, edit our original Motoko source file and go through the deployment process again.

**The redeployment of our actor will wipe out the main memory of the actor!**

There are two main ways to upgrade the functionality of a service without resetting the _memory state_ of the underlying actor.

This chapter describes [_stable variables_](/internet-computer-programming-concepts/basic-memory-persistence/stable-variables.html) which are a way to _persist_ the state of mutable variables across [_upgrades_](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html). Another way is to use [_stable memory_](/advanced-concepts/scalability/stable-storage.html), which will be discussed later in this book.
