# Candid
All *shared types and values* in Motoko have a corresponding *description* in the 'outside world'. This description defines the types and values independently of Motoko or any other language. These alternative descriptions are written in a special *Interface Description Language* called [Candid](https://internetcomputer.org/docs/current/references/candid-ref).  

## Shared Types
Candid has a slightly different notation (syntax) and keywords to represent [shared types](/internet-computer-programming-concepts/async-data/shared-types.html). 

### Primitive types
[Primitive types](/internet-computer-programming-concepts/async-data/shared-types.html#shared-primitive-types) in Candid are written without capital letters:  

| Motoko | Candid |
|---|---|
| Bool | bool | 
| Nat | nat | 
| Int | int |
| Float | float64 |
| Principal | principal | 
| Text | text |
| Blob | blob |  

### Option types
[Option types](/internet-computer-programming-concepts/async-data/shared-types.html#shared-option-types) in Candid are written with the `opt` keyword. An option type in Motoko like `?Principal` would be represented in Candid as:
```candid
opt principal
```

### Tuple types
[Tuple types](/internet-computer-programming-concepts/async-data/shared-types.html#shared-tuple-types) in Candid have the same parenthesis notation `()`. A Motoko tuple `(Nat, Text, Principal)` would be represented in Candid as:
```candid
(nat, text, principal)
```

### Immutable array types
The [immutable array type](/internet-computer-programming-concepts/async-data/shared-types.html#shared-immutable-array-types) `[]` is represented in Candid with the `vec` keyword. 

A Motoko array type `[Nat]` in candid looks like this:
```candid
vec nat
```

### Variant types
[Variant types](/internet-computer-programming-concepts/async-data/shared-types.html#shared-variant-types) in Candid are written with the `variant` keyword and curly braces `{ }`. A Motoko variant like `{#A : Nat; #B : Text}` would be represented in Candid like this:
```candid
variant { 
    A : nat; 
    B : text 
};
```
The `#` character is not used

### Object types
[Object types](/internet-computer-programming-concepts/async-data/shared-types.html#shared-object-types) in Candid are written with the `record` keyword and curly braces `{ }`. A Motoko object type like `{name : Text; age : Nat}` in Candid looks like this:
```candid
record { 
    name : text;
    age : nat
};
```

### Public shared function types
[Public shared function types](/internet-computer-programming-concepts/async-data/shared-types.html#shared-function-types) in Candid have a slightly different notation. A shared public function type in Motoko like `shared () -> async Nat` would be represented in Candid like this:
```candid
() -> (nat)
```

Parentheses `()` are used around the arguments and return types. The shared keyword is not used because all representable functions in Candid are by default only [public shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors). 

Another example would be the Motoko public shared function type `shared query Bool -> async Text` which in Candid would be represented as:
```candid
(bool) -> (text) query
```

Note that the `query` keyword appears after the return types. 

A Motoko *oneway* public shared function type `shared Nat -> ()` in Candid would be represented as:
```candid
(nat) → () oneway
```

### The `type` keyword
Type aliases (custom names) in Candid are written with the `type` keyword. A Motoko type alias like `type MyType = Nat` would be represented in Candid like this:
```candid
type MyType = nat
```




## Actor Interfaces
An [actor](/internet-computer-programming-concepts/actors.html) running in a [canister](/internet-computer-programming-concepts/actor-to-canister.html) has a Candid description of its interface. Consider the following actor in a Motoko source file `main.mo`:

```motoko
{{#include _mo/candid.mo}}
``` 

Only public types and [public shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) are included in the *candid interface*. This actor has a `public type` and two `public shared functions`. Both of these are part of its public interface. 

The actor could have other fields, but they won't be included in the Candid Interface. 

We describe this actor's interface in a Candid `.did` file. A Candid Interface contains all the information an external user needs to interact with the actor from the "outside world". The Candid file for the actor above would be:

```candid
// candid.did
type User = record {
   principal;
   text;
};
 
service : {
  getUser: () -> (User) query;
  doSomething: () -> () oneway;
}
``` 

Our Candid Interface consists of two parts: a `type` and a `service`.

The `service : { }` lists the *names* and *types* of the public shared functions of the actor. This is the information needed to *interact* with the actor from "the outside" by calling its functions. In fact, actors are sometimes referred to as *services*. 

The type reflects the public Motoko type `User` from our actor. Since this is a public Motoko type that is used as a return type in a public shared function, it is included in the Candid Interface.

> **NOTE**  
> *The type alias `User` is a Motoko tuple `(Principal, Text)`. In Candid a custom type alias for a tuple is translated into `record { principal; text }`. Don't confuse it with the Candid tuple type `(principal, text)`!*


### Candid Serialization
Another important use of Candid is *data serialization* of [shared types](/internet-computer-programming-concepts/async-data/shared-types.html). Data structures in Motoko, like in any other language, are not always stored as serial (contiguous) bytes in *working memory*. When we want to *send* shared data in and out of a canisters or store data in [stable memory](/advanced-concepts/scalability/stable-storage.html), we have to *serialize* the data before sending. 

Motoko has built in support for serializing shared types into Candid format. A *higher order* data type like an object can be converted into a *binary blob* that would still have a shared type.

Consider the following relatively complex data structure:
```motoko
{{#include _mo/candid2.mo:a}}
```

Our object type `MyData` contains a `Text` field and fields of variant types `A` and `B`. We could turn a *value* of type `MyData` into a value of type `Blob` by using the `to_candid()` and `from_candid()` functions in Motoko.
```motoko
{{#include _mo/candid2.mo:b}}
```

We declared a variable of type `MyData` and assigned it a value. Then we *serialized* that data into a `Blob` by using `to_candid()`.

This blob can now be sent or received in arguments or return types of public shared functions or stored in [memory](/advanced-concepts/scalability/stable-storage.html). 

We could recover the original type by doing the opposite, namely deserializing the data back into a Motoko shared type by using `from_candid()`. 
```motoko
{{#include _mo/candid2.mo:c}}
```

We declare a variable with option type `?MyData`, because the `from_candid()` function always returns an option of the original type. Type annotation is required for this function to work. We use a `switch` statement after deserializing to handle both cases of the option type.  