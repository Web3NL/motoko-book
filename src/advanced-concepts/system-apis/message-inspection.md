# Message Inspection

A running canister on the Internet Computer (IC) can receive calls to its [_public shared functions_](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) that may take a [_message object_](/internet-computer-programming-concepts/principals-and-authentication.html#caller-authenticating-public-shared-functions) that contains information about the _function call_. The function could for example implement [_caller authentication_](/internet-computer-programming-concepts/principals-and-authentication.html#caller-authenticating-public-shared-functions) based on the information provided in the message object.

Additionally, the IC provides _message inspection_ functionality to inspect [_update_](/internet-computer-programming-concepts/actors.html#public-shared-update) or [_oneway_](/internet-computer-programming-concepts/actors.html#public-shared-oneway) calls (and even [update calls to query functions](#how-it-works)) and either _accept_ or _decline_ the call _before_ running a public shared function.

> **NOTE**  
> _Message inspection is executed by a [single replica](#message-inspection-vs-caller-identifying-functions) and does not provide the full security guarantees of going through consensus._

## The `inspect` system function

In Motoko, this functionality can be implemented as a _system function_ called `inspect`. This function takes a [record](/common-programming-concepts/types/records.html) as an argument and returns a `Bool` value. If we _name_ the record argument `args`, then the _function signature_ looks like this:

```motoko
system func inspect(args) : Bool
```

Note that the [return type](/internet-computer-programming-concepts/actors.html#shared-async-types) is NOT `async`. Also, this function CANNOT update the [state of the actor](/internet-computer-programming-concepts/basic-memory-persistence.html).

### How it works

The `inspect` function is run before any external _update_ call (via an IC ingress message) to an [_update_](/internet-computer-programming-concepts/actors.html#public-shared-update), [_oneway_](/internet-computer-programming-concepts/actors.html#public-shared-oneway) or [_query_](/internet-computer-programming-concepts/actors.html#public-shared-query) function of an [actor](/internet-computer-programming-concepts/actors.html). The call to the [actor](/internet-computer-programming-concepts/actors.html) is then _inspected_ by the `inspect` system function.

> **NOTE**  
> *The most common way to call a `query` function is through a query call, but query functions could also be called by an *update call* (less common). The latter calls are slower but more trustworthy: they require consensus and are charged in cycles. Update calls to query methods are protected by message inspection too, though query call to query methods are not!*

The argument to the `inspect` function (an object we call `args` in the function signature above) is provided by the IC and contains information about:

- The name of the [public shared function](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) that is being called and a function to obtain its arguments
- The [caller](/internet-computer-programming-concepts/principals-and-authentication.html#caller-authenticating-public-shared-functions) of the function
- The _binary content_ of the _message argument_.

The `inspect` function may examine this information about the call and decide to either _accept_ or _decline_ the call by returning either `true` or `false` respectively.

> **NOTE**  
> _Ingress query calls to [query functions](/internet-computer-programming-concepts/actors.html#public-shared-query) and any calls from [other canisters](/advanced-concepts/async-programming/cross-canister-calls-and-rollbacks.html) are NOT inspected by the `inspect` system function._

### The `inspect` function argument

The argument to the `inspect` system function is provided by the IC. The type of this argument depends on the [type of the actor](/internet-computer-programming-concepts/actors.html#actor-type). Lets consider an [actor](/internet-computer-programming-concepts/actors.html) of the following [actor type](/internet-computer-programming-concepts/actors.html#actor-type):

```motoko
{{#include _mo/message-inspection1.mo:a}}
```

The functions `f1` and `f2` are _update_ functions and `f3` is a _oneway_ function. Also, `f2` takes a `Nat` argument and `f3` takes a `Text` argument.

The argument to the `inspect` system function (which we call `args` in this example) for this specific [actor](/internet-computer-programming-concepts/actors.html) will be a [record](/common-programming-concepts/types/records.html) of the following type:

```motoko
{{#include _mo/message-inspection1.mo:b}}
```

This record contains three fields with _predefined_ names:

- The `caller` field is always of type `Principal`.
- The `arg` field is always of type `Blob`.
- The `msg` field is always a [variant](/common-programming-concepts/types/variants.html) type and its fields will depend on the [type of the actor](/internet-computer-programming-concepts/actors.html#actor-type) that this `inspect` function is defined in.

### The `msg` variant and 'function-argument-accessor' functions

The `msg` [variant](/common-programming-concepts/types/variants.html) inside the argument for the `inspect` system function will have a field for every public shared function of the [actor](/internet-computer-programming-concepts/actors.html). The variant _field names_ `#f1`, `#f2` and `#f3` correspond the the _function names_ `f1`, `f2` and `f3`.

But the _associated types_ for the variant fields **ARE NOT** the types of the [actor functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors). Instead, the types of the variant fields `#f1`, `#f2` and `#f3` are 'function-argument-accessor' functions that we can call (if needed) inside the `inspect` system function.

In our example these 'function-argument-accessor' function types are:

```motoko
() -> ();
() -> Nat;
() -> Text;
```

These functions return the arguments that were supplied during the call to the public shared function. They always have unit argument type but return the argument type of the corresponding shared function. The return type of each accessor thus depends on the shared function that it is inspecting.

For example function `f2` takes a `Nat`. If we wanted to _inspect_ this value, we could call the _associated function_ of variant `#f2`, which is of type `() -> Nat`. This function will provide the actual argument passed in the call to the public shared function.

## Actor with Message Inspection

Lets implement the `inspect` system function for the example [actor](/internet-computer-programming-concepts/actors.html) given above:

```motoko
{{#include _mo/message-inspection.mo}}
```

We implemented an actor that _inspects_ any call to its [public shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) and performs checks on _update_ and _oneway_ functions before they are called.

First, the `Principal` module is imported and the [actor](/internet-computer-programming-concepts/actors.html) is declared with three [public shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) `f1`, `f2` and `f3`.

Then, we defined `CallArgs` as the record type of the _expected_ argument to the `inspect` system function. We then declare the system function and use `CallArgs` to annotate the `args` argument.

We can now access all the information for any function call inside the `inspect` function through the _chosen_ name `args`. (We could have chosen any other name)

Inside `inspect` we first check whether the `caller` field of `args`, which is a `Principal`, is equal to the anonymous principal. If so, then `inspect` returns `false` and the call is _rejected_. Anonymous principals can't call any functions of this [actor](/internet-computer-programming-concepts/actors.html).

Another check is performed on the size of the `arg` field value of our `args` record. If the _binary message argument_ is larger than `1024` bytes, then the call is _rejected_ by returning `false` once more.

Our `inspect` implementation ends with a switch expression that checks every case of the `msg` variant inside `args`.

In the case function `f1` is called, we ignore the possible arguments supplied to it by using the wildcard `_` for the 'function-variable-accessor' function and always _accept_ the call by always returning `true`.

In case function `f2` is called, we bind the 'function-argument-accessor' function to the local name `f2Args` and run it to get the value of the argument to `f2`, which is a `Nat`. If this value is smaller then `100`, we _accept_ the call, otherwise we _reject_.

In case function `f3` is called, we bind the 'function-argument-accessor' function to the local name `f3Args` and run it to get the value of the argument to `f3`, which is a `Text`. If this value is equal to `"some text"`, we _accept_ the call, otherwise we _reject_.

## Pattern matching and field renaming

Instead of defining the type `CallArgs` beforehand and referring to the object argument `args` by name, we could use [_pattern matching_](/common-programming-concepts/pattern-matching.html) and rename the fields in the function signature:

```motoko
{{#include _mo/message-inspection2.mo:a}}
```

We now declared `inspect` with a _record pattern_ as the argument.

We pattern match on the `caller` field and rename it to `id`. We could now just refer to `id` inside the function.

By [subtyping](/advanced-types/subtyping.html), we are allowed to ignore the `arg` field all together.

And notice that we use the `Any` type as the _associated type_ of the `#f1` variant, because we don't care about the variable values supplied in calls to the `f1` function.

Inside the function, we switch on `msg` and only handle the case where function `f2` is called. If the variable value to `f2` is less than `100`, we _accept_, otherwise we _reject_ the call.

In all other cases, we check whether `id` is the [anonymous principal](/internet-computer-programming-concepts/principals-and-authentication.html#anonymous-principal). If it is, we _reject_, otherwise we _accept_ the call.

## Message inspection vs Caller identifying functions

The `inspect` system function should not solely be used for _secure access control_ to [actors](/internet-computer-programming-concepts/actors.html). It may be used to _reject_ possibly unwanted calls to an [actor](/internet-computer-programming-concepts/actors.html) before they are executed. Without message inspection, all calls are accepted by default, executed and charged for in [cycles](/project-deployment/cycles-and-icp.html).

Message inspection is executed by a single replica (without full consensus, like a [query call](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors)) and its result could be spoofed by a malicious boundary node.

_Secure access control_ checks can only be performed by:

1. Implementing [public shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) in an [actor](/internet-computer-programming-concepts/actors.html) which implement the [caller identification](/internet-computer-programming-concepts/principals-and-authentication.html#caller-authenticating-public-shared-functions) pattern.
1. Additionally guard incoming calls by the `inspect` system function.
