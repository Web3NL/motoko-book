# Principals and Authentication

Principals are _unique identifiers_ for either _[canisters](/internet-computer-programming-concepts/actors/actor-to-canister.html)_ or _[clients](/internet-computer-programming-concepts/canister-calling.html)_ (external users). Both a canister or an external user can use a principal to _authenticate_ themselves on the Internet Computer.

Principals in Motoko are a _[primitive type](/common-programming-concepts/types.html#primitive-types)_ called `Principal`. We can work directly with this type or use an alternative textual representation of a principal.

Here's an example of the textual representation of a principal:

```motoko
{{#include _mo/principals.mo:a}}
```

The variable `principal` is of type `Text` and has a textual value of a principal.

## Anonymous principal

There is one special principal called the _anonymous_ principal. It used to authenticate to the Internet Computer anonymously.

```motoko
{{#include _mo/principals.mo:b}}
```

We will use this principal [later](#calling-an-actor-anonymously) in this chapter.

## The Principal Type

To convert a textual principal into a value of type `Principal` we can use the [Principal module](/base-library/primitive-types/principal.html).

```motoko
{{#include _mo/principals2.mo:a}}
```

We _[import](/common-programming-concepts/modules.html)_ the Principal module from the [Base Library](/base-library.html) and name it `P`. We then defined a variable named `principal` of type `Principal` and assigned a value using the `.fromText()` _method_ available in the Principal module.

We could now use our `principal` variable wherever a value is expected of type `Principal`.

## Caller Authenticating Public Shared Functions

There is a special _message object_ that is available to [public shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors). Today (Jan 2023) it is only used to _authenticate_ the caller of a function. In the future it may have other uses as well.

This message [object](/common-programming-concepts/objects-and-classes/objects.html) has the following type:

```motoko
{{#include _mo/principals2.mo:b}}
```

We chose the name `MessageObject` arbitrarily, but the type `{ caller : Principal }` is a special _object type_ available to public shared functions inside actors.

To use this object, we must _[pattern match](/common-programming-concepts/pattern-matching.html)_ on it in the function signature:

```motoko
public shared(messageObject) func whoami() : async Principal {
    let { caller } = messageObject;
    caller;
};
```

Our public shared update function now specifies a _variable name_ `messageObject` (enclosed in parenthesis `()`) in its signature after the `shared` keyword. We now named the special message object `messageObject` by pattern matching.

In the function body we pattern match again on the `caller` field of the object, thereby extracting the field name `caller` and making it available in the function body. The variable `caller` is of type `Principal` and is treated as the return value for the function.

The function still has the same function type regardless of the message object in the function signature:

```motoko
{{#include _mo/principals2b.mo:a}}
```

We did not have to pattern match inside the function body. A simple way to access the caller field of the message object is like this:

```motoko
public shared query (msg) func call() : async Principal {
    msg.caller;
};
```

This time we used a public shared query function that returns the principal obtained from the message object.

## Checking the Identity of the Caller

If an actor specifies public shared functions and is deployed, then anyone can call its publicly available functions. It is useful to know whether a caller is _anonymous_ or _authenticated_.

Here's an actor with a public shared query function which checks whether its caller is anonymous:

```motoko
{{#include _mo/principals4.mo:a}}
```

We now used pattern matching in the function signature to _rename_ the `caller` field of the message object to `id`. We also declared a variable `anon` of type `Principal` and set it to the anonymous principal.

The function checks whether the _calling principal_ `id` is equal to the _anonymous principal_ `anon`.

Later in this book we will learn about _[message inspection](/advanced-concepts/message-inspection.html)_ where we can inspect all incoming messages before calling a function.
