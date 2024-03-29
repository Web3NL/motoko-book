# Options and Results

In this chapter we discuss the _Option_ type and the _Result_ variant type.

They are different concepts but they are generally used for the same purpose, namely specifying the return type of functions. Options are used more widely beyond function return types, where as Results mostly appear as function return type.

## Options

An option type is a type that can either have some value or have no value at all.

An _option type_ is a type preceded by a question mark `?`.  
An _option value_ is a value preceded by a question mark `?`.

Some examples:

```motoko
{{#include _mo/options-and-results.mo:a}}
```

Variable `a` is annotated with option type `?Nat` and assigned the option value `?202`. The option value must be of the same type as the option type, meaning the value `202` is of type `Nat`.

Every _option value_ can have the value `null`, which is a special 'value' indicating the absence of a value. The `null` value has type `Null`. For example:

```motoko
{{#include _mo/options-and-results.mo:b}}
```

We assign the value `null` to variable `x` which has option type `?Nat`. In the second line we type annotated the `null` value with its `Null` type.

Lets use an option type as the return type of two functions:

```motoko
{{#include _mo/options-and-results.mo:c}}
```

The two functions both have `?Nat` as their return type. The first returns an option value and the second returns `null`.

In the next chapter about [control flow](/common-programming-concepts/control-flow/switch-expression.html#a-little-program) we will demonstrate how we can use option types in a useful way.

## Results

To fully understand Results we have to understand [generics](/advanced-types/generics.html) first, which are an advanced topic that we will cover later in this book. For now we will only cover a limited form of the Result variant type to give a basic idea of the concept.

A Result type is a _[variant type](/common-programming-concepts/types/variants.html)_. A simple definition could be:

```motoko
{{#include _mo/options-and-results.mo:d}}
```

A value of this type may be one of two possible variants, namely `#ok` or `#err`. These variants are used to indicate either the _successful result_ of a function or a _possible error_ during the evaluation of a function.

Lets use the Result type in the same way we used Options above:

```motoko
{{#include _mo/options-and-results.mo:e}}
```

Both functions have `Result` as their return type. The one returns the `#ok` variant and the other return the `#err` variant.

In the next chapter about [control flow](/common-programming-concepts/control-flow/switch-expression.html#a-little-program) we will demonstrate how we can use the Result variant type in a useful way.
