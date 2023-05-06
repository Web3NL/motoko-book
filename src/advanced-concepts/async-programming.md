# Async Programming

The Internet Computer offers an _asynchronous programming paradigm_ in which actors interact with each other through _asynchronous message passing_ (async function calls). 

##  Ingress Messages vs Inter-Canister Messages
An ingress message is a message sent by an end-user to a canister

**Outgoing message** An actor running in a canister can execute an _async call_ by calling another canister's public shared functions.
**Incoming message** An actor running in a canister can receive an _async call_ when another canister calls its public shared functions.

> **NOTE** > _A canister can also call its own public shared functions_

- Async function calls and Messaging
- Async Futures and Await
- Atomicity, commit points and state rollbacks
- Messaging Restrictions
- Errors and Traps

Calls, Messages and Atomicity (commit points)
an atomic operation is one that is either fully completed or not executed at all
The points at which tentative state changes and message sends are irrevocably committed are:
implicit exit from a shared function by producing a result,
explict exit via return or throw expressions, and
explicit await expressions.

Async context and Messaging Restrictions
-throw error
-await (async call)

-system hooks can’t send messages

Async Await
async T: asychronous future or promise
await e: suspends computation pending e’s result
Functions that await are not atomic.
Suspension introduces concurrency hazards.
Beware of race conditions!
A function that does not await in its body is guaranteed to execute atomically - in particular, the environment cannot change the state of the actor while the function is executing. If a function performs an await, however, atomicity is no longer guaranteed. Between suspension and resumption around the await, the state of the enclosing actor may change due to concurrent processing of other incoming actor messages. It is the programmer’s responsibility to guard against non-synchronized state changes. A programmer may, however, rely on any state change prior to the await being committed.

Errors and traps
A trap is a non-recoverable runtime failure caused by, for example, division-by-zero, out-of-bounds array indexing, numeric overflow, cycle exhaustion or assertion failure.

State rollbacks
