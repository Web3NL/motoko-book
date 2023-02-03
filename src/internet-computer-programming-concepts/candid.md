## Candid
All *shared types and values* in Motoko have a corresponding *description* in the 'outside world'. This description defines the types and values independently of Motoko or any other language. These alternative descriptions are written in a special *Interface Description Language* called Candid.  

### Motoko Types and Actor Interfaces
An [actor](/internet-computer-programming-concepts/actors.html) running in a [canister](/internet-computer-programming-concepts/actor-to-canister.html) has a Candid description of its interface. Consider the following actor:

```motoko
{{#include _mo/candid.mo}}
``` 

Only public types and public shared functions are included in the *candid interface*. This actor has a `public type` and a `public shared function`. Both of these are part of its public interface. 

The actor could have other fields, but they won't be included in the Candid Interface. 

We describe this actor's interface in a Candid `.did` file. A Candid Interface contains all the information an external user needs to interact with the actor from the "outside world". The Candid file for the actor above would be:

```candid
// candid.did
{{#include _mo/candid.did}}
``` 

Our Candid Interface consists of two parts: a `type` and a `service`.

The `service : { }` lists the *names* and *types* of the public shared functions of the actor. This is the information needed to *interact* with the actor from "the outside" by calling its functions. In fact, actors are sometimes referred to as *services*. 

The type reflects the public Motoko type `User` from our actor, which is a Motoko tuple of `(Principal, Text)`. In Candid, the tuple is translated into `record { principal; text; };`. Since this is a public Motoko type that is used as return type in a public shared function, it is included in the Candid Interface.

Candid has a slightly different notation (syntax) and keywords than Motoko. See the full [Candid Reference](https://internetcomputer.org/docs/current/references/candid-ref).

### Candid Serialization
Another important use of Candid is *data serialization* of [shared types](/internet-computer-programming-concepts/shared-types.html). Data structures in Motoko, like in any other language, are not always stored as serial (contiguous) bytes in memory. When we want to *send* shared data in and out of a canisters, we have to *serialize* the data before sending. 

Motoko has built in support for serializing shared types into Candid format. 

TBD