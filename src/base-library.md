# The Base Library

The Motoko Base Library is a collection of [modules](/common-programming-concepts/modules.html) with basic functionality for working with _primitive types_, _utilities_, _data structures_ and other functionality.

Most modules define a _[public type](/common-programming-concepts/modules.html#public-types-in-modules)_ that is associated with the core use of the module.

The Base Library also includes _IC system APIs_ that today (Jan 2023) are still experimental. We will visit them [later in this book](/advanced-concepts.html).

## Importing from the Base Library

An [import](/common-programming-concepts/modules.html#imports) from the base library looks like this:

```motoko
{{#include _mo/base-lib.mo:a}}
```

We imported the [`Principle`](/base-library/primitive-types/principal.html) module. The `P` in the example is an arbitrary _alias_ (name) that we choose to _reference_ our module. The import path starts with `mo:base/` followed by the _file name_ where the module is defined (without the `.mo` extension).

The _file name_ and our chosen _module name_ do not have to be the same (like in the example above). It is a convention though to use the [same name](/common-programming-concepts/modules.html#type-imports-and-renaming):

```motoko
{{#include _mo/base-lib2.mo:a}}
```

Our imported module, now named `Principal`, has a [module type](/common-programming-concepts/modules.html#module-type) `module { ... }` with public fields. It exposes several [_public types_](/common-programming-concepts/modules.html#public-types-in-modules) and [_public functions_](/common-programming-concepts/modules.html#public-functions-in-modules) that we can now reference by using our alias:

```motoko
{{#include _mo/base-lib2.mo:b}}
```

Note the two meanings of `Principal`:

- The [type annotation](/common-programming-concepts/types.html) for variable `p` uses the always available [_primitive type_](/common-programming-concepts/types.html#primitive-types) `Principal`. This _type_ does not have to be imported.

- We used the `.fromText()` _method_ from the `Principal` module (public functions in [modules](/common-programming-concepts/modules.html) or in [objects or classes](/common-programming-concepts/objects-and-classes.html) are often called methods) by referencing it through our chosen _module name_ `Principal`.

## Assertions

In this chapter, we will use [assertions](/common-programming-concepts/assertions.html) that always evaluate to `()` in the code examples to illustrate the results of the manipulations we perform.
