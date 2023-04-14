# Actors

Actors, like [objects](/common-programming-concepts/objects-and-classes/objects.html), are like a package of _state_ and a _public API_ that accesses and modifies that state. They are declared using the `actor` keyword and have an [_actor type_](#actor-type).

## Top level actors

Today (Jan 2023), an actor in Motoko is defined as a top-level item in its own Motoko source file. Optionally, it may be preceded by one or more imports:

```motoko
{{#include _mo/actors.mo:a}}
```

We declared an empty actor in its own source file `actor.mo`. It is preceded by an [import of a module](/common-programming-concepts/modules.html) defined in `mod.mo` and named `Mod` for use inside the actor.

You may feel disappointed by the simplicity of this example, but this setup (one source file containing **only** _imports_ and _one actor_) is the core of every Motoko program!

## Actors vs. objects

Unlike [objects](/common-programming-concepts/objects-and-classes/objects.html), actors may **only** have `private` (immutable or mutable) variables. We can only communicate with an actor by calling its [public shared functions](#public-shared-functions-in-actors) and never by directly modifying its `private` variables. In this way, the [_memory state_](/internet-computer-programming-concepts/basic-memory-persistence.html) of an actor is isolated from other actors. Only public shared functions (and some system functions) can change the memory state of an actor.

To understand actors it is useful to compare them with objects:

### Public API

- [Public functions in actors](#public-shared-functions-in-actors) are accessible from outside the Internet Computer.
- [Public functions in objects](/common-programming-concepts/objects-and-classes/objects.html#public-functions-in-objects) are only accessible from within your Motoko code.

### Private and public variables

- Actors don't allow public ([immutable](/common-programming-concepts/variables.html) or [mutable](/common-programming-concepts/mutability.html)) variables
- Objects do allow public ([immutable](/common-programming-concepts/variables.html) or [mutable](/common-programming-concepts/mutability.html)) variables

### Public shared functions

- Actors only allow _[shared](#public-shared-functions-in-actors)_ public functions
- Objects only allow non-shared public functions

### Class and Actor Class

- Actors have 'factory' functions called [Actor Classes](/advanced-concepts/scalability/actor-classes.html)
- Objects have 'factory' functions called [Classes](/common-programming-concepts/objects-and-classes/classes.html)

For a full comparison checkout: [**Motoko Items Comparison Table**](https://docs.google.com/spreadsheets/d/1IqgPi9I9EmoknJBzzxea_7dN9WRwtFle7Y99UURXC7Y/edit?usp=sharing)

## Public Shared Functions in Actors

Actors allow _three kinds_ of public functions:

1. Public [**shared query**](#public-shared-query) functions:  
   Can only _read_ state

1. Public [**shared update**](#public-shared-update) functions:  
   Can _read_ and _write_ state

1. Public [**shared oneway**](#public-shared-oneway) functions:  
   Can _read_ and _write_, but don't have any _return value_.

> **NOTE**  
> _Public shared query functions are fast, but don't have the full security guarantees of the Internet Computer because they do not 'go through' consensus_

### Shared async types

The argument and return types of public shared functions are restricted to _[shared types](/internet-computer-programming-concepts/async-data/shared-types.html)_ only. We will cover shared types [later](/internet-computer-programming-concepts/async-data/shared-types.html) in this book.

_Query_ and _update_ functions always have the special `async` return type.  
_Oneway_ functions always immediately return `()` regardless of whether they execute successfully.

These functions are only allowed inside _actors_. Here are their _function signatures_ and _function types_.

### Public shared query

```motoko
public shared query func read() : async () { () };

// Has type `shared query () -> async ()`
```

The function named `read` is declared with `public shared query` and returns `async ()`. This function is not allowed to modify the state of the actor because of the `query` keyword. It can only read state and return most types. The `shared query` and `async` keywords are part of the function type. Query functions are fast.

### Public shared update

```motoko
public shared func write() : async () { () };

// Has type `shared Text -> async ()`
```

The function named `write` is declared with `public shared` and also returns `async ()`. This function is allowed to modify the state of the actor. There is no other special keyword (like query) to indicate that this is an update function. The `shared` and `async` keywords are part of the function type. Update functions take 2 seconds per call.

### Public shared oneway

```motoko
public shared func oneway() { () };

// Has type `shared () -> ()`
```

The function named `oneway` is also declared with `public shared` but does not have a return type. This function is allowed to modify the state of the actor. Because it has no return type, it is assumed to be a oneway function which always returns `()` regardless of whether they execute successfully. Only the `shared` keyword is part of their type. Oneway functions also take 2 seconds per call.

In our example none of the functions take any arguments for simplicity.

> **NOTE**  
> _The `shared` keyword may be left out and Motoko will assume the public function in an actor to be `shared` by default. To avoid confusion with public functions elsewhere (like [modules](/common-programming-concepts/modules.html), [objects](/common-programming-concepts/objects-and-classes/objects.html) or [classes](/common-programming-concepts/objects-and-classes/classes.html)) we will keep using the shared keyword for public functions in actors_

## A simple actor

Here's an actor with one _state_ variable and some functions that _read_ or _write_ that variable:

```motoko
{{#include _mo/actors3.mo:a}}
```

This actor has one private mutable variable named `latestComment` of type `Text` and is initially set to the empty string `""`. This variable is not visible 'from the outside', but only available internally inside the actor. The actor also demonstrates the three possible public functions in any actor.

Then first function `readComment` is a _query_ function that takes no arguments and only reads the state variable `latestComment`. It returns `async Text`.

The second function `writeComment` is an _update_ function that takes one argument and modifies the state variable. It could return some value, but in this case it returns `async ()`.

The third function `deleteComment` is a _oneway_ function that doesn't take any arguments and also modifies the state. But it can not return any value and always returns `()` regardless of whether it successfully updated the state or not.

## Actor type

Only public shared functions are part of the type of an actor.

The type of the actor above is the following:

```motoko
{{#include _mo/actors4.mo:a}}
```

We named our actor type `CommentActor`. The type itself starts with the `actor` keyword followed by curly braces `{}` (like objects). Inside we find the three function names as fields of the type definition.

Every field name is a public shared function with its own _function type_. The order doesn't matter, but the Motoko orders them alphabetically.

`readComment` has type `shared query () -> async Text` indicating it is a _shared query_ function with no arguments and `async Text` return type.

`writeComment` has type `shared Text -> async ()` indicating it is an _shared update_ function that takes one `Text` argument and returns no value `async ()`.

`deleteComment` has type `shared () -> ()` indicating it is a _shared oneway_ function that takes no arguments and always returns `()`.
