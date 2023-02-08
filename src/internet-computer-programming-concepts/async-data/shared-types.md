# Shared Types
Incoming and outgoing data are defined by the *argument types* and *return types* of [public shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) inside actors. Incoming and outgoing data types are restricted to a *subset* of available Motoko types, called *shared types*.

Shared types are always *immutable* types or data structures composed of immutable types (like [records](/common-programming-concepts/types/records.html), [objects](/common-programming-concepts/objects-and-classes/objects.html) and [variants](/common-programming-concepts/types/variants.html)). 

Shared types get their name from being *sharable* with the outside world, that is the wider internet beyond the [actors](/internet-computer-programming-concepts/actors.html) running in [canisters](/internet-computer-programming-concepts/actor-to-canister.html) on the Internet Computer.

## Shared Types in Public Shared Functions
Only shared types are allowed for *arguments* and *return values* of public shared functions. We give examples of a custom *public shared function type* called `SharedFunction` to illustrate shared types. [Recall](/internet-computer-programming-concepts/actors.html#actor-type) that a public shared function type includes the `shared` and `async` keywords.

Here are the most important shared types in Motoko.

### Shared Primitive Types
All [primitive types](/common-programming-concepts/types.html#primitive-types) (except the [`Error`](/base-library/utils/error.html) type) are shared.
```motoko
{{#include _mo/shared.mo:a}}
```
The argument of type `Nat` and the return value of type `Text` are shared types.

### Shared Option Types
Any shared type in Motoko can be turned into an [*Option*](/common-programming-concepts/options-and-results.html) type which remains shared. 
```motoko
{{#include _mo/shared2.mo:a}}
```
The argument of type `?Principal` and the return value of type `?Bool` are shared types.

### Shared Tuple Types
[Tuples](/common-programming-concepts/types/tuples.html) consisting of shared types are also shared, that is they are *shared tuple types*. 
```motoko
{{#include _mo/shared3.mo:a}}
```
The argument `(Nat, Int, Float)` and the return value `(Principal, Text)` are shared tuple types. 

### Shared Immutable Array Types
[Immutable arrays](/common-programming-concepts/types/immutable-arrays.html) consisting of shared types are also shared, that is they are *shared immutable array types*. 
```motoko
{{#include _mo/shared4.mo:a}}
```
The types `[Int]` and `[Nat]` are shared immutable array types. 

### Shared Variant Types
[Variant types](/common-programming-concepts/types/variants.html) that have *shared associated types* are also shared. 
```motoko
{{#include _mo/shared5.mo:a}}
```
The variant type `GenderAge` is a shared type because `Nat` is also shared. 

### Shared Object Types
[Object types](/common-programming-concepts/types/variants.html) that have *shared field types* are also shared. 
```motoko
{{#include _mo/shared6.mo:a}}
```
Object type `User` is a shared type because `Principal` and `GenderAge` are also shared types. 

### Shared Function Types
[Shared function types](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) are also shared types. This example shows a shared public function that has another shared public function as its argument and return type. 
```motoko
{{#include _mo/shared7.mo:a}}
```
`CheckBalance` is a shared type because it is the type of a public shared function.

### Shared Actor Types
All [actor types](/internet-computer-programming-concepts/actors.html#actor-type) are shared types. 
```motoko
{{#include _mo/shared8.mo:a}}
```
`Account` is a shared type because it is the type of an actor.


