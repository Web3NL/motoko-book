# Message Inspection
A running canister on the Internet Computer (IC) can receive calls to its [*public shared functions*](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) that may implement [*caller authentication*](/internet-computer-programming-concepts/principals-and-authentication.html#caller-authenticating-public-shared-functions). 

The IC provides additional *message inspection* functionality to inspect incoming calls and to either *accept* or *decline* the call *before* running a public shared function. 

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
type myActor = actor {
    f1 : shared () : async ();
    f2 : shared Nat : async ();
    f3 : shared Text : ();
};
```
The functions `f1` and `f2` are *update* functions and `f3` is a *oneway* function. Also, `f2` takes a `Nat` argument and `f3` takes a `Text` argument. 

The argument to the `inspect` system function (which we call `args` in this example) for this specific actor will be an object of the following type:
```motoko
type Args = {
    caller : Principal;
    arg : Blob;
    msg : {
        #f1 : () -> ();
        #f2 : () -> Nat;
        #f3 : () -> Text;
    };
};
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
    #f1 : () -> ();
    #f2 : () -> Nat;
    #f3 : () -> Text;
```
These functions return the variable arguments that were supplied during the call to the public shared function. Thus, they always have unit argument types and return the variable type of the called function. 

For example function `f2` takes a `Nat`. If we wanted to *inspect* this value, we could call the *associated function* of variant `#f2`, which is of type `() -> Nat`. This function will provide the actual argument passed in the call to the public shared function.

## Example of an Actor with Message Inspection
Lets implement the `inspect` system function for the example actor given above:
```motoko
{{#include _mo/message-inspection.mo}}
```

### Pattern matching and field renaming

## Message inspection vs Caller identifying functions
The `inspect` system function should not be used for *secure access control* to [actors](/internet-computer-programming-concepts/actors.html). It may be used to *decline* possibly unwanted calls to an actor before they are executed. Without message inspection, all calls are accepted by default, executed and charged for in [cycles](/project-deployment/cycles-and-icp.html).
 
Message inspection is executed by a single replica (without full consensus, like a [query call](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors)) and its result could be spoofed by a malicious boundary node. 

*Secure access control* checks can only be performed by:
1. Implementing [public shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) in an actor which implement the [caller identifying](/internet-computer-programming-concepts/principals-and-authentication.html#caller-authenticating-public-shared-functions) message object 
1. Additionally guard incoming calls by the `inspect` system function.