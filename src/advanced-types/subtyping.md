# Sub-typing

Motoko's modern type system allows us to think of some types as being either a _subtype_ or a _supertype_. If a type `T` is a subtype of type `U`, then a value of type `T` can be used everywhere a value of type `U` is expected.

To express this relationship we write:

```motoko
T <: U
```

`T` is a _subtype_ of `U`. And `U` is a _supertype_ of `T`.

## `Nat` and `Int`

The most common subtype in Motoko is `Nat`. It is a subtype of `Int`, making `Int` its supertype.

A `Nat` can be used everywhere an `Int` is expected, but not the other way around.

```motoko
{{#include _mo/subtyping.mo:a}}
```

The function `returnInt` has to return an `Int` or some subtype of `Int`. Since `Nat` is a subtype of `Int`, we could return `0 : Nat` where an `Int` was expected.

Here's another example of using a `Nat` where an `Int` is expected:

```motoko
{{#include _mo/subtyping.mo:a1}}
```

Our tuple type `T` takes an `Int` as the second element of the tuple. But we construct a value with a `Nat` as the second element.

We can not supply a `Nat` for the third element, because `Nat` is not a subtype of `Text`. Neither could we supply a negative number like `-10 : Int` where a `Nat` or `Text` is expected, because `Int` is not a subtype of `Nat` or `Text`.

## Subtyping variants

A variant `V1` can be a subtype of some other variant `V2`, giving us the relationship `V1 <: V2`. Then we could use a `V1` everywhere a `V2` is expected. For a variant to be a _subtype_ of another variant, it must contain a _subset_ of the fields of its _supertype_ variant.

Here's an example of two variants both being a subtype of another third variant:

```motoko
{{#include _mo/subtyping.mo:b}}
```

Variant type `RGB` is a supertype of both `Red` and `Blue`. This means that we can use `Red` or `Blue` everywhere a `RGB` is expected.

```motoko
{{#include _mo/subtyping.mo:c}}
```

We have a function `rgb` that takes an argument of type `RGB`. We could construct values of type `Red` and `Blue` and pass those into the function.

## Subtyping objects

The subtype-supertype relationship for objects and their fields, is reversed compared to [variants](#subtyping-variants). In contrast to variants, an object subtype has more fields than its object supertype.

Here's an example of two object types `User` and `NamedUser` where `NamedUser <: User`.

```motoko
{{#include _mo/subtyping.mo:d}}
```

The supertype `User` only contains one field named `id`, while the subtype `NamedUser` contains two fields, one of which is `id` again. This makes `NamedUser` a subtype of `User`.

This means we could use a `NamedUser` wherever a `User` is expected, but not the other way around.

Here's an example of a function `getId` that takes an argument of type `User`. It will reference the `id` field of its argument and return that value which is expected to be a `Nat` by definition of the `User` type.

```motoko
{{#include _mo/subtyping.mo:e}}
```

So we could construct a value of expected type `User` and pass it as an argument. But an argument of type `NamedUser` would also work.

```motoko
{{#include _mo/subtyping.mo:g}}
```

Since `NamedUser` also contains the `id` field, we also constructed a value of type `NamedUser` and used it where a `User` was expected.

## Backwards compatibility

An important use of subtyping is _backwards compatibility_.

Recall that [actors](/internet-computer-programming-concepts/actors.html) have [actor interfaces](/internet-computer-programming-concepts/async-data/candid.html#actor-interfaces) that are basically comprised of [public shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) and [public types in actors](/internet-computer-programming-concepts/async-data/candid.html#actor-interfaces). Because actors are [upgradable](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html), we may _change_ the interface during an upgrade.

It's important to understand what kind of changes to actors maintain _backwards compatibility_ with existing clients and which changes _break_ existing clients.

> **NOTE**  
> _Backwards compatibility depends on the [Candid interface](/internet-computer-programming-concepts/async-data/candid.html#actor-interfaces) of an actor. Candid has more permissive subtyping rules on variants and objects than Motoko. This section describes Motoko subtyping._

### Actor interfaces

The most common upgrade to an actor is the addition of a public shared function. Here are two versions of [actor types](/internet-computer-programming-concepts/actors.html#actor-type):

```motoko
{{#include _mo/subtyping.mo:h}}
```

The first actor only has one public shared function `post`. We can upgrade to the second actor by adding the function `get`. This upgrade is backwards compatible, because the _function signature_ of `post` did not change.

Actor `V2` is a subtype of actor `V1` (like in the case of [object subtyping](/advanced-types/subtyping.html#subtyping-objects)). This example looks similar to object subtyping, because `V2` includes all the functions of `V1`. We can use `V2` everywhere an actor type `V1` is expected.

### Breaking backwards compatibility

Lets demonstrate an upgrade that would NOT be backwards compatible. Lets upgrade to `V3`:

```motoko
{{#include _mo/subtyping.mo:i}}
```

We only changed the return type of the `get` function from `Nat` to `Int`. This change is NOT backwards compatible! The reason for this is that the new version of the public shared function `get` is not a _subtype_ of the old version.

### Subtyping public shared functions

Public shared functions in actors can have a subtype-supertype relationship. A public shared function `f1` could be a subtype of another public shared function `f2`, giving us the the relationship `f1 <: f2`.

This means that we can use `f1` everywhere `f2` is expected, but not the other way around. But more importantly, we could safely upgrade from the supertype `f2` to the subtype `f1` without breaking backwards compatibility.

Lets look at an example where `f1 <: f2`:

```motoko
{{#include _mo/subtyping2.mo:a}}
```

Function `f1` is a subtype of `f2`. For this relationship to hold, two conditions must be satisfied:

- The _return type_ of `f1` must be a subtype of the return type of `f2`
- The _argument(s)_ of `f2` must be a subtype of the argument(s) of `f1`

The return type `Nat` of function `f1` is a subtype of return type `Int` of function `f2`.  
The argument `Nat` of function `f2` is a subtype of argument `Int` of function `f1`.

The types of `f1` and `f2` in Motoko are:

```motoko
{{#include _mo/subtyping2.mo:b}}
```

Upgrading a public shared function of type `F2` to a public shared function of type `F1` is considered a backwards compatible upgrade.

Since `F1` is a subtype of `F2` and public shared functions are a [shared type](/internet-computer-programming-concepts/async-data/shared-types.html), we could use these types like this:

```motoko
{{#include _mo/subtyping2.mo:c}}
```

We are returning `f1` of type `F1` where a `F2` is expected.

### Upgrading public shared functions

Suppose we have the following types:

```motoko
{{#include _mo/subtyping3.mo:a}}
```

Variant `Args` is a subtype of variant `ArgsV2`. Also, object type `ResultV2` is a subtype of object type `Result`.

We may have a function that uses `Args` as the argument type and `Result` as the return type:

```motoko
{{#include _mo/subtyping3.mo:b}}
```

We could upgrade to a new version with types `ArgsV2` and `ResultV2` without breaking backwards compatibility, as long as we keep the same _function name_:

```motoko
{{#include _mo/subtyping4.mo:a}}
```

This is because `Args` is a _subtype_ of `ArgsV2` and `Result` is a _supertype_ of `ResultV2`.
