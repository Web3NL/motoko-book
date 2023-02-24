# The Base Library
The Motoko Base Library is a collection of [modules](/common-programming-concepts/modules.html) with basic functionality for working with *primitive types*, *utilities*, *data structures* and other functionality. 

Most modules define a *[public type](/common-programming-concepts/modules.html#public-types-in-modules)* that is associated with the core use of the module. 

The Base Library also includes *IC system APIs* that today (Jan 2023) are still experimental. We will visit them [later in this book](/advanced-concepts.html).

## Importing from the Base Library

An [import](/common-programming-concepts/modules.html#imports) from the base library looks like this:

```motoko
{{#include _mo/base-lib.mo:a}}
```

We imported the [`Principle`](/base-library/primitive-types/principal.html) module. The `P` in the example is an arbitrary *alias* (name) that we choose to *reference* our module. The import path starts with `mo:base/` followed by the *file name* where the module is defined (without the `.mo` extension).

The *file name* and our chosen *module name* do not have to be the same (like in the example above). It is a convention though to use the [same name](/common-programming-concepts/modules.html#type-imports-and-renaming): 

```motoko
{{#include _mo/base-lib2.mo:a}}
```

Our imported module, now named `Principal`, has a [module type](/common-programming-concepts/modules.html#module-type) `module { ... }` with public fields. It exposes several *public types and functions* that we can now reference by using our alias:

```motoko
{{#include _mo/base-lib2.mo:b}}
```

The [type annotation](/common-programming-concepts/types.html) for variable `p` uses the always available *primitive type* `Principal`. This type does not have to be imported. 

We used the `.fromText()` *method* (public functions in [modules](/common-programming-concepts/modules.html) and [objects or classes](/common-programming-concepts/objects-and-classes.html) are often called methods) by referencing it through our chosen name `Principal`.

## Assertions
In this chapter, we will use [assertions](/common-programming-concepts/assertions.html) that always evaluate to `()` in the code examples to illustrate the results of the manipulations we perform. 
