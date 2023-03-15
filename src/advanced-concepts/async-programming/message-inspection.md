# Message Inspection
A running canister on the Internet Computer (IC) can receive calls to its [*public shared functions*](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) that may implement [*caller authentication*](/internet-computer-programming-concepts/principals-and-authentication.html#caller-authenticating-public-shared-functions). 

The IC provides additional *message inspection* functionality to inspect incoming calls and either *accept* or *decline* the call *before* running a public shared function. 

## The `inspect` system function
In Motoko, this functionality can be implemented as a *system function* called `inspect`. This function takes an [object](/common-programming-concepts/objects-and-classes/objects.html) as an argument and returns a `Bool` value. If we *name* the object argument `args`, then the *function signature* looks like this:
```motoko
system func inspect(args) : Bool
``` 

Note that the [return type](/internet-computer-programming-concepts/actors.html#shared-types) is NOT `async`. Also, this function CAN NOT update the [state of the actor](/internet-computer-programming-concepts/basic-memory-persistence.html). 



### How it works
The `inspect` function is run before any call to an [*update*](/internet-computer-programming-concepts/actors.html#public-shared-update) or [*oneway*](/internet-computer-programming-concepts/actors.html#public-shared-oneway) function of an [actor](/internet-computer-programming-concepts/actors.html). The call to the actor is then *inspected* by the `inspect` system function. 

The argument to the `inspect` function (an object we call `args` in the function signature above) is provided by the IC and contains information about:
- The [public shared function](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) that is being called
- The [caller](/internet-computer-programming-concepts/principals-and-authentication.html#caller-authenticating-public-shared-functions) of the function
- The *binary content* of the *message argument*. 

The `inspect` function may examine this information about the call and decide to either *accept* or *decline* the call by returning either `true` or `false` respectively. 

> **NOTE**  
> *Calls to either [query functions](/internet-computer-programming-concepts/actors.html#public-shared-query), [other canisters](/advanced-concepts/async-programming/cross-canister-calls-and-rollbacks.html) or the [management canister](/common-internet-computer-canisters/ic-management-canister.html) are NOT inspected by the `inspect` system function.*

### The `inspect` function argument
The argument to the `inspect` system function is provided by the IC. The type of this argument depends on the [type of the actor](/internet-computer-programming-concepts/actors.html#actor-type). Lets consider an actor of the following actor type:
```motoko
{{#include _mo/message-inspection1.mo:a}}
```
The functions `f1` and `f2` are *update* functions and `f3` is a *oneway* function. Also, `f2` takes a `Nat` argument and `f3` takes a `Text` argument. 

The argument to the `inspect` system function (which we call `args` in this example) for this specific actor will be an object of the following type:  
```motoko
{{#include _mo/message-inspection1.mo:b}}  
``` 

This object contains three fields with *predefined* names: 
- The `caller` field is always of type `Principal`.
- The `arg` field is always of type `Blob`.
- The `msg` field is always a variant type and will depend on the [type of the actor](/internet-computer-programming-concepts/actors.html#actor-type) that this `inspect` function is defined in.

### The `msg` variant and 'function-variable-accessor' functions
The `msg` variant inside the argument for the `inspect` system function will have a field for every public shared function of the actor. The variant *field names* `#f1`, `#f2` and `#f3` correspond the the *function names* `f1`, `f2` and `f3`. 

But the *associated types* for the variant fields **ARE NOT** the types of the functions! Instead, the types of the variant fields `#f1`, `#f2` and `#f3` are 'function-variable-accessor' functions that we could call inside the `inspect` system function. 

In our example these 'function-variable-accessor' function types are:
```motoko
{{#include _mo/message-inspection1.mo:c}}  
```
These functions return the variable arguments that were supplied during the call to the public shared function. Thus, they always have unit argument types and return the variable type of the called function. 

For example function `f2` takes a `Nat`. If we wanted to *inspect* this value, we could call the *associated function* of variant `#f2`, which is of type `() -> Nat`. This function will provide the actual argument passed in the call to the public shared function.

## Actor with Message Inspection
Lets implement the `inspect` system function for the example actor given above:
```motoko
{{#include _mo/message-inspection.mo}}
```

We implemented an actor that *inspects* any call to its public shared functions and performs checks ons *some* functions before they are called. 

First, the `Principal` module is imported and the actor is declared with three public shared functions `f1`, `f2` and `f3`.

Then, we defined `CallArgs` as the object type of the *expected* argument to the `inspect` system function. We then declare the system function and use `CallArgs` to annotate the `args` argument. 

We can now access to all the information for any function call inside the `inspect` function through the *chosen* name `args`. (We could have chosen any other name)  

Inside `inspect` we first check whether the `caller` field of `args`, which is a `Principal`, is equal to the anonymous principal. If so, then `inspect` returns `false` and the call is *rejected*. Anonymous principals can't call any functions of this actor.  

Another check is performed on the size of the `arg` field value of our `args` object. If the *binary message argument* is larger than `1024` bytes, then the call is *rejected* by returning `false` once more.  

Our `inspect` implementation ends with a switch expression that checks every case of the `msg` variant inside `args`. 

In the case function `f1` is called, we ignore the possible arguments supplied to it by using the wildcard `_` for the 'function-variable-accessor' function and always *accept* the call by always returning `true`.

In case function `f2` is called, we bind the 'function-variable-accessor' function to the local name `f2Args` and run it to get the value of the argument to `f2`, which is a `Nat`. If this value is smaller then `100`, we *accept* the call, otherwise we *reject*. 

In case function `f3` is called, we bind the 'function-variable-accessor' function to the local name `f3Args` and run it to get the value of the argument to `f3`, which is a `Text`. If this value is equal to `"some text"`, we *accept* the call, otherwise we *reject*. 

## Pattern matching and field renaming
Instead of defining the type `CallArgs` beforehand and referring to the object argument `args` by name, we could use *pattern matching* and rename the fields in the function signature:
```motoko
{{#include _mo/message-inspection2.mo:a}}
```

We now declared `inspect` with an *object literal* as the argument. 

We pattern match on the `caller` field and rename it to `id`. We could now just refer to `id` inside the function.  

By subtyping, we are allowed to ignore the `arg` field all together. 

And notice that we use the `Any` type as the *associated type* of the `#f1` variant, because we don't care about the variable values supplied in calls to the `f1` function. 

Inside the function, we switch on `msg` and only handle the case where function `f2` is called. If the variable value to `f2` is less than `100`, we *accept*, otherwise we *reject* the call. 

In all other cases, we check whether `id` is the anonymous principal. If it is, we *reject*, otherwise we *accept* the call. 

## Message inspection vs Caller identifying functions
The `inspect` system function should not be used for *secure access control* to [actors](/internet-computer-programming-concepts/actors.html). It may be used to *decline* possibly unwanted calls to an actor before they are executed. Without message inspection, all calls are accepted by default, executed and charged for in [cycles](/project-deployment/cycles-and-icp.html).
 
Message inspection is executed by a single replica (without full consensus, like a [query call](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors)) and its result could be spoofed by a malicious boundary node. 

*Secure access control* checks can only be performed by:
1. Implementing [public shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) in an actor which implement the [caller identifying](/internet-computer-programming-concepts/principals-and-authentication.html#caller-authenticating-public-shared-functions) message object 
1. Additionally guard incoming calls by the `inspect` system function.