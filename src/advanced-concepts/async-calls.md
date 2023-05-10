# Async Programming

The asynchronous programming paradigm of the Internet Computer is based on the actor model. Actors are isolated units of code and state that communicate with each other by [sending messages](#messages-and-atomicity).

To master Motoko programming on the IC, we need to understand how to write asynchronous code, how to correctly [handle async calls](#try-catch-expressions) and state mutations and how to avoid [concurrency hazards](#concurrency-hazards).

> **NOTE**  
> _From now on, we will drop the optional `shared` keyword in the declaration of [public shared functions] and refer to these functions as simply 'shared functions'._

### On this page

**[Async and Await](#async-and-await)**

**[Inter-Canister Calls](#inter-canister-calls)**  
[Importing other actors](#importing-other-actors)  
[Inter-Canister Query Calls](#inter-canister-query-calls)

**[Messages and Atomicity](#messages-and-atomicity)**  
[Atomic functions](#atomic-functions)  
[Shared functions that `await`](#shared-functions-that-await)  
[Atomic functions that send messages](#atomic-functions-that-send-messages)  
[State commits and message sends](#state-commits-and-messsage-sends)  
[Message send capability](#messaging-restrictions)  
[Message Queue and Ordering](#message-queue-and-ordering)

**[Errors and Traps](#errors-and-traps)**

**[Async* and Await*](#async-and-await-1)**

**[Try-Catch Expressions](#try-catch-expressions)**

**[Concurrency Hazards](#concurrency-hazards)**

## Async and Await

A call to a shared function immediately returns a _future_ of type [`async T`], where T is a [*shared type*]. A _future_ of type `async T` can be _awaited_ using the `await` keyword to retrieve the value of type `T`.

- Shared function calls and awaits are only allowed in [_asynchronous context_](#messaging-restrictions).
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
> _`call_read()` is executed as several separate [messages](#messages-and-atomicity), see [shared functions that `await`](#shared-functions-that-await)._

## Inter-Canister Calls

Actors can also call the shared functions of other actors. This always happens from within an [_asynchronous context_](#messaging-restrictions).

### Importing other actors

To call the shared functions of other actors, we need the [_actor type_] of the external actor and an _actor reference_.

```motoko
{{#include _mo/async-calls2.mo:a}}
```

The actor type we use may be a [_subtype_] of the external actor type. We declare the actor type `actor {}` with only the shared functions we are interested in. In this case, we are importing the actor from the previous example and are only interested in the [query function] `read`.

We declare a variable `actorA` with actor type `ActorA` and assign an actor reference `actor()` to it. We supply the [principal id] of actor A to reference it remotely. We can now refer to the shared function `read` of actor A as `actorA.read`.

Finally, we `await` the shared function `read` of actor A yielding a `Nat` value that we use as a return value for our [update function] `callActorA`.

### Inter-Canister Query Calls

Calling a [query function] from an actor is currently (May 2023) only allowed from inside an [update function], because query functions don't yet have [message send capability](#messaging-restrictions).

'Inter-Canister Query Calls' will be available on the IC in the future. For now, only ingress messages (from [external clients] to the IC) can request a fast query call ([without going through consensus]).

## Messages and atomicity

A call to a shared function of any actor A, whether from an [_external client_], [from itself](#async-and-await) or from another actor B (as an [Inter-Canister Call](#inter-canister-calls)), results in an [_incoming message_](#message-queue-and-ordering) to actor A.

A single message is executed _atomically_. This means that the code executed within one message either executes successfully or not at all. This also means that any _state mutations_ within a single message are either all committed or none of them are committed.

**An `await` ends the current message and splits the execution of a function into [separate messages](#shared-functions-that-await).**

### Atomic functions

An atomic function is one that executes within one single message. The function either executes successfully or has no effect at all. If an atomic function fails, we know for sure **its own** state mutations have not been committed.

**If a shared function does not `await` in its body, then it is atomic.**

```motoko
{{#include _mo/async-calls4.mo:a}}
```

Our function `atomic` mutates the state, performs a computation on constant `C` and mutates the `state` again. Both the computation and the state mutations belong to the same message execution. The whole function either succeeds and commits all state mutations or it fails and does not commit any changes at all.

The second function `atomic_fail` is another atomic function. It also performs a computation and state mutations within one single message. **But this time, the computation [traps] and both state mutations are not committed, even though the trap happened after the first state mutation.**

The order in which computations and state mutations occur is not relevant for the atomicity of a function. The whole function is executed as a single message that either fails or succeeds in its entirety.

### Shared functions that `await`

The [async-await](#async-and-await) example earlier looks simple, but there is a lot going on there. The function call is executed as several separate messages:

The first line `let future : async Nat = read()` is executed as part of the first message.

The second line `let result = await future;` keyword ends the first message and any state changes made during execution of the message are committed. The `await` also calls `read()` and suspends execution until a response is received.

The call to `read()` is executed as a separate message and could possibly be executed remotely in another actor, see [inter-canister calls](#inter-canister-calls). The message sent to `read()` could possibly result in several messages if the `read()` function also `await`s in its body. In this case it doesn't and couldn't because [query functions currently can't `await`](#inter-canister-query-calls).

If the sent message executes successfully, a _callback_ is made to `call_read` that is executed as yet another message as the the last line `result + 1`.

In total, there are **three messages**, two of which are executed inside the calling actor as part of `call_read` and one that is executed elsewhere, possibly a remote actor. In this case `actor A` sends a message to itself.

> **NOTE**  
> _Even if we don't `await` a future, a [message](#messages-and-atomicity) could still be sent and [remote code execution](#atomic-functions-that-send-messages) could be initiated and change the state remotely or locally, see [*state commits*](#state-commits-and-message-sends)._

### Atomic functions that send messages

A successful atomic function may or may not mutate the state itself, but successful execution could cause multiple messages to be sent (by calling shared functions) that each may or may not execute (and possibly mutate state) successfully, see [state commits](#state-commits-and-message-sends).

```motoko
{{#include _mo/async-calls5.mo:a}}
```

We have two state variables `s1` and `s2` and two shared functions that mutate them. Both functions `incr_s1` and `incr_s2` are each executed atomically as single messages. (They do not `await` in their body).

`incr_s1` should execute successfully, while `incr_s2` will trap and revert any state mutation.

A call to `atomic` will execute successfully without mutating the state during its own execution. When `atomic` exits successfully [with a result](#state-commits-and-message-sends), the calls to `incr_s1` and `incr_s2` are committed and two separate messages are sent, see [state commits](#state-commits-and-message-sends).

Now, `incr_s1` will mutate the state, while `incr_s2` does not. The values of `s1` and `s2`, after the successful atomic execution of `atomic` will be `1` and `0` respectively.

These function calls could have been calls to shared function in remote actors, therefore initiating remote execution of code and possible remote state mutations.

> **NOTE**  
> _We are using the `ignore` keyword to ignore return types that are not the empty tuple `()` to resume execution. For example, `0 / 0` should in principle return a `Nat`, while `incr_s1()` returns a future of type `async ()`. Both are ignored as if they return `()`._

### State commits and message sends

The points at which a _state changes_ and _message sends_ are irrevocably committed are:

1. **Implicit exit from a shared function by producing a result**  
   The function executes until the end of its body and produces the expected return value with which it is declared.

1. **Explicit exit via return**  
   Think of an early return like:

```motoko
public func early_return(b : Bool) : async Text {
    if (b) return "returned early";

    "executed till end"
};
```

1. **Explicit [throw expressions](#errors)**
   When an error is thrown, the state changes up until the error are committed.

1. **Explicit [await expressions](#shared-functions-that-await)**
   As we have seen in the [shared functions that `await`](#shared-functions-that-await) example, an `await` ends the current message and splits the execution of a function into separate messages.

[*See official docs*]

### Message send capability

### Messaging Restrictions

The Internet Computer places restrictions on when and how canisters are allowed to communicate. In Motoko this means that there are restrictions on when and where the use of _async expressions_ is allowed.

**An expression in Motoko is said to occur in an _asynchronous context_ if it appears in the body of an `async` or `async*` expression.**

Therefore, calling a shared function from outside an asynchronous context is not allowed, because calling a shared function requires a message to be sent. For the same reason, calling a shared function from an [actor class] constructor is also not allowed, because an actor class is not an asynchronous context and so on.

Examples of messaging restrictions:

- Canister installation can execute code (and possibly [trap](#traps)), but not send messages.

- A canister query method cannot send messages ([yet](#inter-canister-query-calls))

- The `await` and `await*` constructs are only allowed in an asynchronous context.

- The `throw` expression (to throw an [error](#errors)) is only allowed in an asynchronous context.

- The `try-catch` expression is only allowed in an asynchronous context. This is because error handling is supported for _messaging errors_ only and, like messaging itself, confined to asynchronous contexts.

### Message Queue and Ordering

## Errors and Traps

During the execution of a message, an _error_ may be thrown or a _trap_ may occur.

### Errors

- An [error] is thrown _intentionally_ to inform a caller that something is not right.
- State changes up until an error within a message are committed.
- Code after an error within a message is **NOT** executed, therefore state changes after an error within a message are **NOT** committed.
- Errors can be handled using [`try-catch`] expressions.
- Errors can only be thrown in an [asynchronous context](#messaging-restrictions).
- To work with errors we use the `Error` module in the [base library].

### Traps

- A trap is an _unintended_ non-recoverable runtime failure caused by, for example, division-by-zero, out-of-bounds array indexing, numeric overflow, cycle exhaustion or assertion failure.
- A trap during the execution of a single message causes the entire message to fail.
- State changes before and after a trap within a message are **NOT** committed.
- Traps can be handled using [`try-catch`] expressions.
- A trap may occur intentionally for development purposes, see [Debug.trap()]
- A trap can happen anywhere code runs in an actor, not only in an [asynchronous context](#messaging-restrictions).

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

## Async* and Await*

Recall that [shared functions] are part of the [actor type] and therefore publicly visible as the public API of the actor. Shared functions also provide an [asynchronous context](#messaging-restrictions) from which other shared functions can be called and awaited, because calling and awaiting requires messages to be sent.

Private `async*` functions provide an [asynchronous context](#messaging-restrictions) without exposing the function as part of the public API of the actor. A call to an `async*` function also immediately returns a future that can be awaited using the `await*` keyword in any asynchronous context.

Furthermore, an `async*` function that only uses `await*` in its body to await futures of other `async*` functions, is guaranteed to be atomic. This means that either all `await*` expressions within a `async*` function are executed successfully or non of them have any effect at all.

## Try-Catch Expressions

## Concurrency Hazards

<!--

Functions that await are not atomic.
Suspension introduces concurrency hazards.
Beware of race conditions!
A function that does not await in its body is guaranteed to execute atomically - in particular, the environment cannot change the state of the actor while the function is executing. If a function performs an await, however, atomicity is no longer guaranteed. Between suspension and resumption around the await, the state of the enclosing actor may change due to concurrent processing of other incoming actor messages. It is the programmer’s responsibility to guard against non-synchronized state changes. A programmer may, however, rely on any state change prior to the await being committed.


-->
