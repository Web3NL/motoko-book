# Async Programming

The asynchronous programming paradigm of the Internet Computer is based on the actor model.

[Actors](/internet-computer-programming-concepts/actors.html) are isolated units of code and state that communicate with each other by calling each others' [shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) where each shared function call triggers at least 1 or more [messages](#messages-and-atomicity) to be sent and executed.

To master Motoko programming on the IC, we need to understand how to write _asynchronous code_, how to [**correctly handle async calls using try-catch**](#try-catch-expressions) and mutate the state safely.

> **NOTE**  
> _From now on, we will drop the optional `shared` keyword in the declaration of [shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) and refer to these functions as simply 'shared functions'._

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
[Messaging restrictions](#messaging-restrictions)  
[Message ordering](#message-ordering)

**[Errors and Traps](#errors-and-traps)**  
[Errors](#errors)  
[Traps](#traps)

**[Async* and Await*](#async-and-await-1)**  
[`await` and `await*`](#await-and-await)  
[Atomic `await*`](#atomic-await)  
[Non-atomic `await*`](#non-atomic-await)  
[Keeping track of state commits and message sends](#keeping-track-of-state-commits-and-message-sends)

**[Table of asynchronous functions in Motoko](#table-of-asynchronous-functions-in-motoko)**

**[Try-Catch Expressions](#try-catch-expressions)**

## Async and Await

A call to a [shared function](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) immediately returns a _future_ of type [`async T`], where T is a [*shared type*]. A _future_ of type `async T` can be _awaited_ using the `await` keyword to retrieve the value of type `T`.

- Shared function calls and awaits are only allowed in [_asynchronous context_](#messaging-restrictions).
- Shared function calls that immediately return a future, do not suspend execution of the code.
- Awaits using `await` do suspend execution of code until a [_callback_](#shared-functions-that-await) is received.

[Actors](/internet-computer-programming-concepts/actors.html) can call their own [shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors). Here is an actor calling its own shared function from another shared function:

```motoko
{{#include _mo/async-calls.mo:a}}
```

The first call to `read` immediately returns a future of type `async Nat`, which is the [return type](/internet-computer-programming-concepts/actors.html#shared-async-types) of our [shared query](/internet-computer-programming-concepts/actors.html#public-shared-query) function `read`. This means that the caller does not wait for a response from `read` and immediately continues execution.

To actually retrieve the `Nat` value, we have to `await` the future. The actor sends a [message](#messages-and-atomicity) to itself with the request and halts execution until a response is received.

The result is a `Nat` that we increment within the [_callback_](#messages-and-atomicity) and use as the return value for `call_read`.

> **NOTE**  
> _Shared functions that `await` are not atomic. `call_read()` is executed as several separate [messages](#messages-and-atomicity), see [shared functions that `await`](#shared-functions-that-await)._

## Inter-Canister Calls

Actors can also call the shared functions of other actors. This always happens from within an [_asynchronous context_](#messaging-restrictions).

### Importing other actors

To call the shared functions of other actors, we need the [_actor type_](/internet-computer-programming-concepts/actors.html#actor-type) of the external actor and an _actor reference_.

```motoko
{{#include _mo/async-calls2.mo:a}}
```

The actor type we use may be a [_subtype_](/advanced-types/subtyping.html) of the external actor type. We declare the actor type `actor {}` with only the shared functions we are interested in. In this case, we are importing the actor from the previous example and are only interested in the [query function](/internet-computer-programming-concepts/actors.html#public-shared-query) `read`.

We declare a variable `actorA` with actor type `ActorA` and assign an actor reference `actor()` to it. We supply the [principal id](/internet-computer-programming-concepts/principals-and-authentication.html) of actor A to reference it. We can now refer to the shared function `read` of actor A as `actorA.read`.

Finally, we `await` the shared function `read` of actor A yielding a `Nat` value that we use as a return value for our [update function](/internet-computer-programming-concepts/actors.html#public-shared-update) `callActorA`.

### Inter-Canister Query Calls

Calling a [query function](/internet-computer-programming-concepts/actors.html#public-shared-query) from an actor is currently (May 2023) only allowed from inside an [update function](/internet-computer-programming-concepts/actors.html#public-shared-update), because query functions don't yet have [message send capability](#messaging-restrictions).

'Inter-Canister Query Calls' will be available on the IC in the future. For now, only ingress messages (from [external clients](/internet-computer-programming-concepts/actors/canister-calling.html) to the IC) can request a fast query call ([without going through consensus](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors)).

## Messages and atomicity

From the [official docs](https://internetcomputer.org/docs/current/developer-docs/security/rust-canister-development-security-best-practices/#inter-canister-calls-and-rollbacks):  
_A message is a set of consecutive instructions that a subnet executes for a canister._

We will not cover the terms 'instruction' and 'subnet' in this book. Lets just remember that a single call to a [shared function](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) can be split up into several messages that execute separately.

A call to a shared function of any actor A, whether from an [_external client_], [from itself](#async-and-await) or from another actor B (as an [Inter-Canister Call](#inter-canister-calls)), results in an _incoming message_ to actor A.

A single message is executed _atomically_. This means that the code executed within one message either executes successfully or not at all. This also means that any _state mutations_ within a single message are either all committed or none of them are committed.

**An `await` ends the current message and splits the execution of a function into [separate messages](#shared-functions-that-await).**

### Atomic functions

An atomic function is one that executes within one single message. The function either executes successfully or has no effect at all. If an atomic function fails, we know for sure **its own** state mutations have not been committed.

**If a shared function does not `await` in its body, then it is atomic.**

```motoko
{{#include _mo/async-calls4.mo:a}}
```

Our function `atomic` mutates the state, performs a computation and mutates the `state` again. Both the computation and the state mutations belong to the same message execution. The whole function either succeeds and commits all state mutations or it fails and does not commit any changes at all.

The second function `atomic_fail` is another atomic function. It also performs a computation and state mutations within one single message. **But this time, the computation [traps](#traps) and both state mutations are not committed, even though the trap happened after the first state mutation.**

Unless an [`Error`](#errors) is thrown _intentionally_ during execution, the order in which computations and state mutations occur is not relevant for the atomicity of a function. The whole function is executed as a single message that either fails or succeeds in its entirety.

### Shared functions that `await`

The [async-await](#async-and-await) example earlier looks simple, but there is a lot going on there. The function call is executed as several separate messages:

The first line `let future : async Nat = read()` is executed as part of the first message.

The second line `let result = await future;` keyword ends the first message and any state changes made during execution of the message are committed. The `await` also calls `read()` and suspends execution until a response is received.

The call to `read()` is executed as a separate message and could possibly be executed remotely in another actor, see [inter-canister calls](#inter-canister-calls). The message sent to `read()` could possibly result in several messages if the `read()` function also `await`s in its body.

If the sent message executes successfully, a _callback_ is made to `call_read` that is executed as yet another message as the the last line `result + 1`.

In total, there are **three messages**, two of which are executed inside the calling actor as part of `call_read` and one that is executed elsewhere, possibly a remote actor. In this case `actor A` sends a message to itself.

> **NOTE**  
> _Even if we don't `await` a future, a [message](#messages-and-atomicity) could still be sent and [remote code execution](#atomic-functions-that-send-messages) could be initiated and change the state remotely or locally, see [*state commits*](#state-commits-and-message-sends)._

### Atomic functions that send messages

A successful atomic function may or may not mutate the state itself, but successful execution of an atomic function could cause multiple messages to be sent (by calling shared functions) that each may or may not execute successfully (and possibly mutate state locally or remotely), see [state commits](#state-commits-and-message-sends).

```motoko
{{#include _mo/async-calls5.mo:a}}
```

We have two state variables `s1` and `s2` and two shared functions that mutate them. Both functions `incr_s1` and `incr_s2` are each executed atomically as single messages. (They do not `await` in their body).

`incr_s1` should execute successfully, while `incr_s2` will trap and revert any state mutation.

A call to `atomic` will execute successfully without mutating the state during its own execution. When `atomic` exits successfully [with a result](#state-commits-and-message-sends), the calls to `incr_s1` and `incr_s2` are committed (without `await`) and two separate messages are sent, see [state commits](#state-commits-and-message-sends).

Now, `incr_s1` will mutate the state, while `incr_s2` does not. The values of `s1` and `s2`, after the successful atomic execution of `atomic` will be `1` and `0` respectively.

These function calls could have been calls to shared function in remote actors, therefore initiating remote execution of code and possible remote state mutations.

> **NOTE**  
> _We are using the `ignore` keyword to ignore return types that are not the empty tuple `()`. For example, `0 / 0` should in principle return a `Nat`, while `incr_s1()` returns a future of type `async ()`. Both are ignored to resume execution._

### State commits and message sends

There are several points during the execution of a shared function at which _state changes_ and _message sends_ are irrevocably committed:

1. **Implicit exit from a shared function by producing a result**  
   The function executes until the end of its body and produces the expected return value with which it is declared. If the function did not `await` in its body, then it is executed atomically within a single message and state changes will be committed once it produces a result.

```motoko
{{#include _mo/async-calls6.mo:a}}
```

2. **Explicit exit via return**  
   Think of an early return like:

```motoko
{{#include _mo/async-calls6.mo:b}}
```

If condition `b` is `true`, the `return` keyword ends the current message and state is committed up to that point only. If `b` is true, `y` will only be incremented once.

3. **Explicit [throw expressions](#example)**  
   When an [error](#errors) is thrown, the state changes up until the error are committed and execution of the current message is stopped.

4. **Explicit [await expressions](#shared-functions-that-await)**  
   As we have seen in the [shared functions that `await`](#shared-functions-that-await) example, an `await` ends the current message, commits state up to that point and splits the execution of a function into separate messages.

[*See official docs*]

### Messaging Restrictions

The Internet Computer places restrictions on when and how canisters are allowed to communicate. In Motoko this means that there are restrictions on when and where the use of _async expressions_ is allowed.

**An expression in Motoko is said to occur in an _asynchronous context_ if it appears in the body of an `async` or `async*` expression.**

Therefore, calling a shared function from outside an asynchronous context is not allowed, because calling a shared function requires a message to be sent. For the same reason, calling a shared function from an [actor class](/advanced-concepts/scalability/actor-classes.html) constructor is also not allowed, because an actor class is not an asynchronous context and so on.

Examples of messaging restrictions:

- Canister installation can execute code (and possibly [trap](#traps)), but not send messages.

- A canister query method cannot send messages ([yet](#inter-canister-query-calls))

- The `await` and `await*` constructs are only allowed in an asynchronous context.

- The `throw` expression (to throw an [error](#errors)) is only allowed in an asynchronous context.

- The `try-catch` expression is only allowed in an asynchronous context. This is because error handling is supported for _messaging errors_ only and, like messaging itself, confined to asynchronous contexts.

[See official docs]

### Message ordering

Messages in an actor are always executed sequentially, meaning one after the other and never in parallel. As a programmer, you have no control over the order in which _incoming messages_ are executed.

You can only control the order in which you send messages to other actors, with the guarantee that they will be executed in the order you sent them. But you have no guarantee on the order in which you receive the _callbacks_ for those messages.

Consult the [official docs](https://internetcomputer.org/docs/current/developer-docs/security/rust-canister-development-security-best-practices/#inter-canister-calls-and-rollbacks) for more information on this topic.

## Errors and Traps

During the execution of a message, an _error_ may be thrown or a _trap_ may occur.

### Errors

An [Error](/base-library/utils/error.html) is thrown _intentionally_ using the `throw` keyword to inform a caller that something is not right.

- State changes up until an error within a message are committed.
- Code after an error within a message is **NOT** executed, therefore state changes after an error within a message are **NOT** committed.
- Errors can be handled using [`try-catch`](#try-catch-expressions) expressions.
- Errors can only be thrown in an [asynchronous context](#messaging-restrictions).
- To work with errors we use the [`Error`](/base-library/utils/error.html) module in the [base library].

```motoko
{{#include _mo/async-calls3-error.mo:a}}
```

We import the [`Error`](/base-library/utils/error.html) module.

We have a shared functions `incrementAndError` that mutates `state` and throws an `Error`. We increment the value of `state` once before and once after the error throw. The function does not return `()`. Instead it results in an error of type `Error` (see [Error](/base-library/utils/error.html) module).

**The first state mutation is committed, but the second is not.**

After `incrementAndError`, our mutable variable `state` only incremented once to value `1`.

### Traps

A trap is an _unintended_ non-recoverable runtime failure caused by, for example, division-by-zero, out-of-bounds array indexing, numeric overflow, cycle exhaustion or assertion failure.

- A trap during the execution of a single message causes the entire message to fail.
- State changes before and after a trap within a message are **NOT** committed.
- Traps can be handled using [`try-catch`](#try-catch-expressions) expressions.
- A trap may occur intentionally for development purposes, see [Debug.trap()](/base-library/utils/debug.html)
- A trap can happen anywhere code runs in an actor, not only in an [asynchronous context](#messaging-restrictions).

```motoko
{{#include _mo/async-calls3-trap.mo:a}}
```

We import the [`Debug`](/base-library/utils/debug.html) module.

The shared function `incrementAndTrap` fails and does not return `()`. Instead it causes the execution to trap (see [Debug](/base-library/utils/debug.html) module).

**Both the first and second state mutation are NOT committed.**

After `incrementAndTrap`, our mutable variable `state` is not changed at all.

> **NOTE**  
> _Usually a trap occurs without `Debug.trap()` during execution of code, for example at underflow or overflow of [bounded types](/base-library/primitive-types/bounded-number-types.html) or other runtime failures, see [traps](#traps)._

## Async* and Await*

Recall that 'ordinary' [shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) with `async` return type are part of the [_actor type_](/internet-computer-programming-concepts/actors.html#actor-type) and therefore publicly visible in the [_public API_](/internet-computer-programming-concepts/async-data/candid.html#actor-interfaces) of the actor. Shared functions provide an [asynchronous context](#messaging-restrictions) from which other shared functions can be called and awaited, because awaiting a shared function requires a [message](#messages-and-atomicity) to be sent.

**Private non-shared functions with `async*` return type** provide an [asynchronous context](#messaging-restrictions) without exposing the function as part of the public API of the actor.

A call to an `async*` function also immediately returns a future. The future **needs** to be awaited using the `await*` keyword (in any asynchronous context `async` or `async*`) to produce a result. This was not the case with un-awaited `async` calls, see [atomic functions that send messages](#atomic-functions-that-send-messages).

For demonstration purposes, lets look at an example of a private `async*` function, that does not use its asynchronous context to call other `async` or `async*` functions, but instead only performs a _delayed computation_:

```motoko
{{#include _mo/async-calls7.mo}}
```

`compute` is a [private function](/common-programming-concepts/functions.html#private-functions) with `async* Nat` return type. Calling it directly yields a _future_ of type `async* Nat` and resumes execution without blocking. This future needs to be awaited using `await*` for the computation to actually execute (unlike the case with 'ordinary' `async` [atomic functions that send messages](#atomic-functions-that-send-messages)).

`await*` also suspends execution, until a result is obtained. We could also pass around the future within our actor code and only `await*` it when we actually need the result.

We `await*` our function `compute` from within an [asynchronous context](#messaging-restrictions).

We `await*` our function `compute` from within an 'ordinary' shared `async` function `call_compute` or from within another private `async*` like `call_compute2`.

In the case of `call_compute` we obtain the result by first declaring a future and then `await*`ing it. In the case of `call_compute2` we `await*` the result directly.

`compute` and `call_compute` are not part of the [_actor type_](/internet-computer-programming-concepts/actors.html#actor-type) and [_public API_](/internet-computer-programming-concepts/async-data/candid.html#actor-interfaces), because it is a [private function](/common-programming-concepts/functions.html#private-functions).

### `await` and `await*`

Private non-shared `async*` functions can both `await` and `await*` in their body.

**`await` always commits the current state and triggers a new message send, where `await*`:**

- does not commit the current state
- does not necessarily trigger new message sends
- could be executed as part of the current message

An `async*` function that only uses `await*` in its body to await futures of other `async*` functions (that also don't 'ordinarily' `await` in their body), is executed as a single message and is guaranteed to be atomic. This means that either all `await*` expressions within a `async*` function are executed successfully or non of them have any effect at all.

This is different form 'ordinary' `await` where each `await` triggers a new message and splits the function call into [several messages](#shared-functions-that-await). State changes from the current message are then committed each time a new `await` happens.

The call to a private non-shared `async*` function is split up into [several messages](#shared-functions-that-await) only when we use an ordinary `await` in its body. Or when we `await*` a `async*` function that 'ordinarily' `await`s in its body.

```motoko
{{#include _mo/async-calls8.mo}}
```

We `await` and `await*` from within a private non-shared `async*` function named `call`.

The `await` suspends execution of the current message, commits the first state mutation and triggers a new message send. In this case the actor sends a message to itself, but it could have been a call to a remote actor.

The sent message is executed, mutating the state again.

When a result is returned we resume execution of `call` within a second message. We mutate the state a third time.

The `await*` acts as if we substitute the body of `incr2` for the line `await* incr2()`. The third state mutation is **not** committed before execution of `incr2()`. No message is sent.

The third and fourth state mutation are committed when we successfully exit `call()`, see [state commits](#state-commits-and-message-sends).

### Atomic `await*`

Here's an example of a nested `await*` within an `async*` function calls:

```motoko
{{#include _mo/async-calls9.mo}}
```

Because `incr()` and `incr2()` do not 'ordinarily' `await` in their body, a call to `atomic()` is executed as single message. It behaves as if we substitute the body of `incr()` for the `await* incr()` expression and similarly substitute the body of `incr2()` for the `await* incr2()` expression.

### Non-atomic `await*`

The [asynchronous context](#messaging-restrictions) that `incr()` provides could be used to `await` 'ordinary' `async` functions.

The key difference is that `await` commits the current message and triggers a new message send, where `await*` doesn't.

Here's an example of a 'nested' `await`:

```motoko
{{#include _mo/async-calls10.mo}}
```

This time `incr2()` is a public shared function with `async ()` return type.

Our function `non_atomic()` performs an `await*` in its body. The `await*` to `incr()` contains an 'ordinary' `await` and thus suspends execution until a result is received. A commit of the state is triggered up to that point and a new message is sent, thereby splitting the call to `non_atomic()` into two messages like we [discussed earlier](#shared-functions-that-await).

This happens because `incr2()` uses an 'ordinary' `await` in its body.

### Keeping track of state commits and message sends

Consider the following scenario's:

- an `await*` for an `async*` function that performed an 'ordinary' `await` in its body.
- an `await*` for an `async*` function that performed an `await*` in its body (**for an `async*` function that does not 'ordinarily' `await`s in its body**) or performs no awaits at all.

In every case, our code should handle [state commits and message sends](#state-commits-and-message-sends) correctly and only mutate the state when we intend to do so.

> **NOTE**  
> _The [`Star.mo`](https://github.com/icdevs/star.mo) library declares a [result type](/base-library/utils/result.html) that is useful for handling `async*` functions. We highly recommend it, but will not cover it here._

## Table of asynchronous functions in Motoko

| **Visibility** | **Async context** | **Return type** | **Awaited with** | **CS and TM\*\*** |
| :------------- | :---------------- | :-------------- | :--------------- | :---------------- |
| `private`      | no                | non-async       | not awaited      | no                |
| `public`       | yes               | `async` future  | `await`          | yes               |
| `private`      | yes               | `async` future  | `await`          | yes               |
| `private`      | yes               | `async*` future | `await*`         | no                |

\*\* Commits state and triggers a new message send.

The private function with 'ordinary' `async` function is not covered in this chapter. It behaves like a public function with 'ordinary' `async` return type, meaning it commits state up to that point when `await`ed and triggers a new message send.

## Try-Catch Expressions

To correctly handle awaits for `async` and `async*` functions, we need to write code that also deals with scenario's in which functions do not execute successfully. This may be due to an [`Error`](#errors) or a [trap](#traps).

In both cases, the failure can be _'caught'_ and handled safely using a _try-catch expression_.

Consider the following failure scenario's:

- an `await` or `await*` for an `async` or `async*` function that throws an [`Error`](#errors).
- an `await` or `await*` for an `async` or `async*` function that [traps](#traps) during execution.

In every case, our code should handle function failures ([errors](#errors) or [traps](#traps)) correctly and only mutate the state when we intend to do so.

In the following examples, we will use [`Result<Ok, Err>`](/base-library/utils/result.html) from the [base library](/base-library.html) as the return type of our functions.

Lets `try` to `await*` a private `async*` function and `catch` any possible errors or traps:

```motoko
{{#include _mo/async-calls11.mo}}
```

We start by importing [`Result`](/base-library/utils/result.html) and [`Error`](/base-library/utils/error.html) from the [base library](/base-library.html) and declare a `Result` type with associated types for our purpose.

Note that our private `async*` function `error()` should under normal circumstances return a `()` when `await*`ed. But it performs some check and could _intentionally_ `throw` an [`Error`](#errors) under some circumstances to alert the caller that something is not right.

To account for this case, we `try` the function first in a try-block `try {}`, where we `await*` for it. If that succeeds, we know the function returned a `()` and we return the `#ok` variant as our `Result`.

But in case an error is thrown, we `catch` it in the catch-block and give it a name `e`. This error has type `Error`, which is a non-shared type that can only happen in an [asynchronous context](#messaging-restrictions).

We analyze our error `e` using the methods from the [Error module](/base-library/utils/error.html) to obtain the [`ErrorCode`](/base-library/utils/error.html) and the error message as a `Text`. We return this information as the associated type of our `#err` variant for our `Result`.

Note, we bind the return value of the whole try-catch block expression to the variable `result` to demonstrate that it is indeed an expression that evaluates to a value. In this case, the try-catch expression evaluates to a `Result` type.

### Catching a trap
The same try-catch expression can be used to catch a [trap](#traps) that occurs during execution of an `async` or `async*` function. 

A trap would surface as an [`Error`](#errors) with system reject code `5` (which isn't part of the [`ErrorCode`](/base-library/utils/error.html) variant) and a message that indicates why the execution trapped. 
