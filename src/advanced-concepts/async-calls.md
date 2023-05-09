# Async Calls

An [actor] can call both its own [public shared functions] (_shared functions_ for short) and the shared functions of other actors.

## Async Futures and Await

The _asynchronous_ call to a shared function returns a _future_ of type [`async T`], where T is a [*shared type*]. A _future_ of type `async T` can be _awaited_ using the `await` keyword to retrieve the value of type `T`.

**Asynchronous calls do not suspend execution of the code.  
Synchronous calls using `await` do suspend execution of code until a _response_ is received.**

Here is an actor calling its own shared function:

```motoko
{{#include _mo/async-calls.mo:a}}
```

The first call to `read` is asynchronous, meaning that the caller does not wait for a response. The call immediately returns a future of type `async Nat`, which is the [shared return type] of our shared function `read`.

To actually retrieve the `Nat` value, we have to `await` the future. The line `await future;` evaluates to a value of type `Nat` and is therefore a correct return value for `call_read`.

**Execution is not suspended when we _asynchronously_ call a shared function with `async` return, but a [_message_](#inter-canister-calls) is sent and remote code execution is initiated, see [_state commits_](#state-commits)**

## Importing other actors

To call the shared functions of other actors, we need the [_actor type_] of the external actor and an _actor reference_.

```motoko
{{#include _mo/async-calls2.mo:a}}
```

The actor type we use may be a [_subtype_] of the external actor. We declare the actor type `actor {}` with only the shared functions we are interested in. In this case, we have a [shared function] `read : shared query () -> async Nat`.

We declare a variable `someActor` with actor type `SomeActor` and assign an actor reference `actor()` to it. We supply the [principal id] of the external actor to reference it remotely.

Finally, we `await` the shared function `read` of the external actor yielding a `Nat` value that we use as a return value for our [shared update function] `callSomeActor`.

> **NOTE**  
> _Calling a [query function] from an actor is only allowed from inside an [update function], because 'Inter-Canister Query Calls' are not yet available on the IC. Only ingress messages (from [external clients]) can do a fast query call ([without going through consensus]) for now. May 2023_

## Messages and atomicity

A call to a shared function of any actor A, whether from an [_external client_], [from itself](#async-futures-and-await) or from another actor B (as an [Inter-Canister Call](#inter-canister-calls)), results in an [_incoming message_](#message-ordering) to actor A.

A single message is executed _atomically_. This means that the code executed within one message either executes successfully or not at all.

This also means that any _state mutations_ within a single message are either all applied or none of them are applied.

> **NOTE**  
> _Don't confuse an [incoming message](#message-ordering) to an actor with an ingress message from an [external client] to the IC (as opposed to an [Inter-Canister Call](#inter-canister-calls))._

### Atomic functions
An atomic function is one that executes within one single message. The function either executes successfully or has no effect at all. If an atomic function fails, we know for sure the state has not been affected. 

```motoko
public shared func atomic() : async () {
    // read actor state    
    // update actor state        
    // possibly trap during execution
    // update state again
    ...   
}
```

If futures are not `await`ed inside a shared function, the function is atomic. 

Our function `atomic` either executes successfully and (possibly) changes the state or it fails and the state is not affected.  

### `await` sends a new message

### State commits

The points at which _state changes_ and _message sends_ are irrevocably committed are:

- Implicit exit from a shared function by producing a result
- Explicit exit via return or [throw expressions] (errors)
- Explicit [await expressions]

[*See official docs*]

## Errors and Traps

During the execution of a message, an _error_ may be thrown or a _trap_ may occur.

### Errors

- An [error] is thrown _intentionally_ to inform a caller that something is not right.
- State changes up until an error within a message are committed.
- Code after an error within a message is **NOT** executed, therefore state changes after an error within a message are **NOT** committed.
- Errors can be handled using [`try-catch`] expressions.
- Errors can only be thrown in an [asynchronous context](#message-send-capability).
- To work with errors we use the `Error` module in the [base library].

### Traps

- A trap is an _unintended_ non-recoverable runtime failure caused by, for example, division-by-zero, out-of-bounds array indexing, numeric overflow, cycle exhaustion or assertion failure.
- A trap during the execution of a single message causes the entire message to fail.
- State changes before and after a trap within a message are **NOT** committed.
- Traps can be handled using [`try-catch`] expressions.
- A trap may occur intentionally for development purposes, see [Debug.trap()]
- A trap can happen anywhere code runs in an actor, not only in an [asynchronous context](#message-send-capability).

### Example

Lets demonstrate state changes before and after errors and traps.

```motoko
{{#include _mo/async-calls3.mo:a}}
```

We import the [`Error`] and [`Debug`] modules.

We have an actor with one [mutable variable] `state` that we mutate from within two shared functions. In both cases, we increment the value of `state` once before and once after an error or trap.

The first shared function `incrementAndError` fails and does not return `()`. Instead it results in an error of type `Error` (see [Error] module). The first state mutation is committed, but the second is not.

After `incrementAndError`, our mutable variable `state` only incremented once.

The second shared function `incrementAndTrap` also fails and does not return `()`. Instead it causes the execution to trap (see [Debug] module). Both the first and second state mutation are **NOT** committed.

After `incrementAndTrap`, our mutable variable `state` is not changed at all.

## Inter-Canister Calls

### Message Ordering

### Message send capability

<!--

Functions that await are not atomic.
Suspension introduces concurrency hazards.
Beware of race conditions!
A function that does not await in its body is guaranteed to execute atomically - in particular, the environment cannot change the state of the actor while the function is executing. If a function performs an await, however, atomicity is no longer guaranteed. Between suspension and resumption around the await, the state of the enclosing actor may change due to concurrent processing of other incoming actor messages. It is the programmer’s responsibility to guard against non-synchronized state changes. A programmer may, however, rely on any state change prior to the await being committed.
-->
