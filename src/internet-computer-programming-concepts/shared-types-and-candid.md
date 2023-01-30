# Shared Types and Candid
Actors expose [public shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) to the outside world. They define the *interface* for interacting with all Motoko programs running in [canisters](/internet-computer-programming-concepts/actor-to-canister.html) on the Internet Computer.

This chapter explains what kind of data is allowed *in* and *out* Motoko programs from the outside world.

## Incoming and Outgoing Data 
Incoming and outgoing data is defined by the *argument types* and *return types* of [public shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) inside actors. Incoming and outgoing data types are restricted to a *subset* of available Motoko types, called *shared types*. 

Shared types are always *immutable* types or data structures (like [records](/common-programming-concepts/types/records.html), [objects](/common-programming-concepts/objects-and-classes/objects.html) and [variants](/common-programming-concepts/types/variants.html)) composed of immutable types. 

## Shared Types in Motoko
Here are the most important shared types in Motoko with examples of [*shared public function types*](/internet-computer-programming-concepts/actors.html#actor-type). 

### Shared Primitive Types
All [primitive types](/common-programming-concepts/types.html#primitive-types) (except the [`Error`](/base-library/utils/error.html) type) are shared.

```motoko
{{#include _mo/shared.mo:a}}
```

### Shared Option Types
Any shared type in Motoko can be turned into an [*Option*](/common-programming-concepts/options-and-results.html) type which remains shared. 

```motoko
{{#include _mo/shared2.mo:a}}
```

### Shared Tuple Types
[Tuples](/common-programming-concepts/types/tuples.html) consisting of shared types are also shared, that is they are *shared tuple types*. 

```motoko
{{#include _mo/shared3.mo:a}}
```

### Shared Immutable Array Types
[Immutable arrays](/common-programming-concepts/types/immutable-arrays.html) consisting of shared types are also shared, that is they are *shared immutable array types*. 

```motoko
{{#include _mo/shared4.mo:a}}
```

### Shared Variant Types
[Variant types](/common-programming-concepts/types/variants.html) that have *shared associated types* are also shared. 

```motoko
{{#include _mo/shared5.mo:a}}
```

### Shared Object Types
[Object types](/common-programming-concepts/types/variants.html) that have *shared field types* are also shared. 

```motoko
{{#include _mo/shared6.mo:a}}
```

### Shared Function Types
[Shared function types](/internet-computer-programming-concepts/actors.html#shared-types) are also shared types. This example shows a shared public function that has another shared public function as its argument and return type. 

```motoko
{{#include _mo/shared7.mo:a}}
```

### Shared Actor Types
All [actor types](/internet-computer-programming-concepts/actors.html#actor-type) are shared types. 

```motoko
{{#include _mo/shared8.mo:a}}
```

## Candid
All shared types in Motoko have a corresponding *type description* in the 'outside world'. This type description defines the data type independently of Motoko or any other language. These alternative type descriptions are written in a special *Interface Description Language* called Candid.  

TBD


