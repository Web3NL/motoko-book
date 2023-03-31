# Type Bounds

When we express a [subtype-supertype relationship](/advanced-types/subtyping.html) by writing `T <: U`, then we say that `T` is a _subtype_ by `U`. We can use this relationship between two types in the instantiation of [generic types in functions](/advanced-types/generics.html#generics-in-functions).

## Type bounds in functions

Consider the following _function signature_:

```motoko
func makeNat<T <: Number>(x : T) : Natural
```

It's a [generic function](/advanced-types/generics.html) that specifies a _type bound_ `Number` for its generic type parameter `T`. This is expressed as `<T <: Number>`.

The function takes an argument of generic bounded type `T` and returns a value of type `Natural`. The function is meant to take a general kind of number and process it into a `Nat`.

The types `Number` and `Natural` are declared like this:

```motoko
{{#include _mo/type-bounds.mo:a}}
```

The types `Natural`, `Integer` and `Floating` are just [variants](/common-programming-concepts/types/variants.html) with one field and associated types `Nat`, `Int` and `Float` respectively.

The `Number` type is a _type union_ of `Natural`, `Integer` and `Floating`. A type union is constructed using the `or` keyword. This means that a `Number` could be either a `Natural`, an `Integer` or a `Floating`.

We would use these types to implement our function like this:

```motoko
{{#include _mo/type-bounds.mo:example}}
```

After [importing](/common-programming-concepts/modules.html) the [Int](/base-library/primitive-types/int.html) and [Float](/base-library/primitive-types/float.html) modules from the [Base Library](/base-library.html), we declare our function and implement a [switch expression](/common-programming-concepts/control-flow/switch-expression.html) for the argument `x`.

In case we find a `#N` we know we are dealing with a `Natural` and thus immediately return the the same variant and associated value that we refer to as `n`.

In case we find an `#I` we know we are dealing with an `Integer` and thus take the associated value `i` and apply the `abs()` function from the [Int module](/base-library/primitive-types/int.html) to turn the `Int` into a `Nat`. We return a value of type `Natural` once again.

In case we find a `#F` we know we are dealing with a `Floating`. So we take the associated value `f` of type `Float`, round it off and convert it to an `Int` using functions from the [Float module](/base-library/primitive-types/float.html) and convert to a `Nat` again to return a value of type `Natural` once again.

Lets test our function using some [assertions](/common-programming-concepts/assertions.html):

```motoko
{{#include _mo/type-bounds.mo:example2}}
```

We use arguments of type `Natural`, `Integer` and `Floating` with associated types `Nat`, `Int` and `Float` respectively. They all are accepted by our function.

In all three cases, we get back a value of type `Natural` with an associated value of type `Nat`.

## The `Any` and `None` types

All types in Motoko are bounded by a special type, namely the `Any` type. This type is the _supertype_ of all types and thus all types are a _subtype_ of the `Any` type. We may refer to it as the _top type_. Any value or expression in Motoko can be of type `Any`.

Another special type in Motoko is the `None` type. This type is the _subtype_ of all types and thus all types are a _supertype_ of `None`. We may refer to it as the _bottom type_. No value in Motoko can have the `None` type, but some expressions can.

> **NOTE**  
> _Even though no value has type `None`, it is still useful for typing expressions that don't produce a value, such as infinite loops, early exits via `return` and `throw` and other constructs that divert control-flow (like Debug.trap : `Text -> None`)_

For any type `T` in Motoko, the following _subtype-supertype_ relationship holds:

```motoko
None <: T

T <: Any
```
