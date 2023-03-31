# Types

A type describes the _data type_ of a value. Motoko has static types. This means that the type of every value is known when the Motoko code is being [_compiled_](http://localhost:3000/internet-computer-programming-concepts/actors/actor-to-canister.html).

Motoko can in many cases know the type of a variable without you doing anything:

```motoko
{{#include _mo/types1.mo}}
```

In the example above the `true` value of variable name `x` has the `Bool` type. We did not state this explicitly but Motoko _infers_ this information automatically for us.

In some cases the type is not obvious and we need to add the type ourselves. This is called _type annotation_. We can annotate the name of the variable like this:

```motoko
{{#include _mo/types2.mo}}
```

With the colon `:` and the name of the type after the variable name, we tell Motoko that `x` is of type `Bool`.

We can also annotate the value:

```motoko
{{#include _mo/types3.mo}}
```

Or both:

```motoko
{{#include _mo/types4.mo:a}}
```

In this case it is unnecessary and makes the code ugly. The convention is to leave spaces around the colon.

## The `type` keyword

We can always _rename_ any type by using the `type` keyword. We could rename the `Bool` type to `B`:

```motoko
{{#include _mo/types4.mo:e}}
```

We defined a new _alias_ for the `Bool` type and named it `B`. We then declare a variable `booelan` of type `B`.

## Primitive types

_Primitive types_ are fundamental core data types that are not _composed_ of more fundamental types. Some common ones in Motoko are:

- [Bool](/base-library/primitive-types/bool.html)
- [Nat](/base-library/primitive-types/nat.html)
- [Int](/base-library/primitive-types/int.html)
- [Float](/base-library/primitive-types/float.html)
- [Text](/base-library/primitive-types/text.html)
- [Principal](/base-library/primitive-types/principal.html)
- [Blob](/base-library/primitive-types/blob.html)

See the [full list of all Motoko data types](https://internetcomputer.org/docs/current/motoko/main/language-manual#primitive-types)

We can define arbitrary names for any type:

```motoko
{{#include _mo/types4.mo:b}}
```

This creates an alias (a second name) `Age` for the `Nat` type. This is useful for writing clear readable code. The convention is to use type names that start with a capital letter.

```motoko
{{#include _mo/types4.mo:c}}
```

The variable name `age` is of type `Age`.

## The unit type

The last type we will mention in this chapter is the _unit type_ `()`. This type is also called the empty [tuple](types/tuples.html) type. It's useful in several places, for example in [functions](functions.html) to indicate that a function does not return any specific type.

For now let's just look at one _ugly, strange and useless_, yet legal Motoko code example for the sake of learning:

```motoko
{{#include _mo/types4.mo:d}}
```

We declared a variable named `unitType` and type annotated this variable name with the unit type. Then we assigned the empty [tuple](types/tuples.html) value `()` to it and also annotated this value with the unit type.

Observe that we type annotate twice, once on the left hand side of the assignment and the other on the right hand side, like we did for variable `x` above.
