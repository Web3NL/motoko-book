# Async Programming

The asynchronous programming paradigm of the Internet Computer is based on the actor model. Actors are isolated units of code and state that communicate with each other by [sending messages](#messages-and-atomicity).

Tho master Motoko programming on the IC, we need to understand the following concepts:

- Async and Await
- Inter-Canister Calls
- Messages and Atomicity
- Errors and Traps
- Async* and Await*
- Try-Catch Expressions

> **NOTE**  
> _From now on, we will drop the optional `shared` keyword in the declaration of [public shared functions] and refer to these functions as simply 'shared functions'._

## Async and Await

A call to a shared function immediately returns a _future_ of type [`async T`], where T is a [*shared type*]. A _future_ of type `async T` can be _awaited_ using the `await` keyword to retrieve the value of type `T`.

- Shared function calls and awaits are only allowed in [_asynchronous context_](#message-send-capability).
- Shared function calls that immediately return a future, do not suspend execution of the code.
- Awaits using `await` do suspend execution of code until a _callback_ is received.

[Actors] can call their own [shared functions]. Here is an actor calling its own shared function from another shared function:

```motoko
{{#include _mo/async-calls.mo:a}}
```

The first call to `read` immediately returns a future of type `async Nat`, which is the [return type] of our [shared query] function `read`. This means that the caller does not wait for a response from `read` and immediately continues execution.

To actually retrieve the `Nat` value, we have to `await` the future. This halts execution until a response is received.

The result is a `Nat` that we increment and use as the return value for `call_read`.

> **NOTE**  
> _This example contains multiple [messages](#messages-and-atomicity), see [shared functions that `await`](#shared-functions-that-await)._

## Inter-Canister Calls

Actors can also call the shared functions of other actors. This always happens from within an [_asynchronous context_](#message-send-capability).

### Importing other actors

To call the shared functions of other actors, we need the [_actor type_] of the external actor and an _actor reference_.

```motoko
{{#include _mo/async-calls2.mo:a}}
```

The actor type we use may be a [_subtype_] of the external actor type. We declare the actor type `actor {}` with only the shared functions we are interested in. In this case, we are importing the actor from the previous example and are only interested in the [query function] `read`.

We declare a variable `actorA` with actor type `ActorA` and assign an actor reference `actor()` to it. We supply the [principal id] of actor A to reference it remotely. We can now refer to the shared function `read` of actor A as `actorA.read`.

Finally, we `await` the shared function `read` of actor A yielding a `Nat` value that we use as a return value for our [update function] `callActorA`.

> **NOTE**  
> _Calling a [query function] from an actor is only allowed from inside an [update function], because query functions don't yet have [message send capability](#message-send-capability). 'Inter-Canister Query Calls' are not yet available on the IC. Only ingress messages (from [external clients]) can do a fast query call ([without going through consensus]) for now. May 2023_

## Messages and atomicity

A call to a shared function of any actor A, whether from an [_external client_], [from itself](#async-futures-and-await) or from another actor B (as an [Inter-Canister Call](#inter-canister-calls)), results in an [_incoming message_](#message-queue-and-ordering) to actor A.

A single message is executed _atomically_. This means that the code executed within one message either executes successfully or not at all. This also means that any _state mutations_ within a single message are either all committed or none of them are committed.

**An `await` ends the current message and splits the execution of a function into [several messages](#shared-functions-that-await).**

### Atomic functions

An atomic function is one that executes within one single message. The function either executes successfully or has no effect at all. If an atomic function fails, we know for sure its own state mutations have not been committed.

If a shared function does not `await` in its body, then it is atomic.

```motoko
{{#include _mo/async-calls4.mo:a}}
```

Our function `atomic` performs a computation on constant `C` and mutates `state` twice. Both the computation and the state mutations belong to the same message execution. It either succeeds and commits all state mutations or it fails and does not commit any changes at all.

The second function `atomic_fail` is another atomic function. It also performs a computation and state mutations within one single message. **But this time, the computation [traps] and both state mutations are not committed, even though the trap happened after the first state mutation.**

The order in which computations and state mutations occur is not relevant for the atomicity of a function. The whole function is executed as a single message that either fails or succeeds in its entirety.

### Shared functions that `await`

The [async-await](#async-and-await) example earlier looks simple, but there is a lot going on there:

- The first call to `read` that returns a future is executed as a single [message](#messages-and-atomicity).
- The `await` keyword ends the current message by committing it and _sends_ a new [message](#messages-and-atomicity).
- This sent message will be executed as a single message and could possibly be executed remotely, see [inter-canister calls](#inter-canister-calls)
- The sent message results in a _callback_ that is executed as yet another message in the the last line of `call_read`.

In total, there are **three messages**, two of which are executed in `call_read` and one that is executed elsewhere.

> **NOTE**  
> _Even if we don't `await` a future, a [message](#messages-and-atomicity) could still be sent and [remote code execution](#atomic-functions-that-send-messages) could be initiated and change the state remotely or locally, see [*state commits*](#state-commits-and-message-sends)._

### Atomic functions that send messages

A successful atomic function may or may not mutate the state itself, but successful execution could cause multiple messages to be sent (by calling shared functions) that each may or may not execute (and possibly mutate state) successfully, see [state commits](#state-commits-and-message-sends).

```motoko
{{#include _mo/async-calls5.mo:a}}
```

We have two state variables `s1` and `s2` and two shared functions that mutate them. Both functions `incr_s1` and `incr_s2` are each executed atomically as single messages. (They do not `await` in their body).

`incr_s1` should execute successfully, while `incr_s2` will trap and revert any state mutation.

A call to `atomic` will execute successfully without mutating the state during its own execution. When `atomic` exits successfully [with a result](#state-commits-and-message-sends), the calls to `incr_s1` and `incr_s2` are committed and two separate messages are sent, see [state commits].

Now, `incr_s1` will mutate the state, while `incr_s2` does not. The values of `s1` and `s2`, after the successful atomic execution of `atomic` will be `1` and `0` respectively.

These function calls could have been calls to shared function in remote actors, therefore initiating remote execution of code and possible remote state mutations.

> **NOTE**  
> _We are using the `ignore` keyword to ignore return types that are not the empty tuple `()` to resume execution. For example, `0 / 0` should in principle return a `Nat`, while `incr_s1()` returns a future of type `async ()`._

### State commits and message sends

The points at which _state changes_ and _message sends_ are irrevocably committed are:

- Implicit exit from a shared function by producing a result
- Explicit exit via return
- Explicit [throw expressions]
- Explicit [await expressions]

[*See official docs*]

### Message send capability

### Message Queue and Ordering

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

<!--

Functions that await are not atomic.
Suspension introduces concurrency hazards.
Beware of race conditions!
A function that does not await in its body is guaranteed to execute atomically - in particular, the environment cannot change the state of the actor while the function is executing. If a function performs an await, however, atomicity is no longer guaranteed. Between suspension and resumption around the await, the state of the enclosing actor may change due to concurrent processing of other incoming actor messages. It is the programmer’s responsibility to guard against non-synchronized state changes. A programmer may, however, rely on any state change prior to the await being committed.

Messaging Restrictions
The Internet Computer places restrictions on when and how canisters are allowed to communicate. These restrictions are enforced dynamically on the Internet Computer but prevented statically in Motoko, ruling out a class of dynamic execution errors. Two examples are:

canister installation can execute code, but not send messages.

a canister query method cannot send messages.

These restrictions are surfaced in Motoko as restrictions on the context in which certain expressions can be used.

In Motoko, an expression occurs in an asynchronous context if it appears in the body of an async expression, which may be the body of a (shared or local) function or a stand-alone expression. The only exception are query functions, whose body is not considered to open an asynchronous context.

In Motoko calling a shared function is an error unless the function is called in an asynchronouus context. In addition, calling a shared function from an actor class constructor is also an error.

The await construct is only allowed in an asynchronous context.

The async construct is only allowed in an asynchronous context.

It is only possible to throw or try/catch errors in an asynchronous context. This is because structured error handling is supported for messaging errors only and, like messaging itself, confined to asynchronous contexts.

These rules also mean that local functions cannot, in general, directly call shared functions or await futures. This limitation can sometimes be awkward: we hope to extend the type system to be more permissive in future.
-->
