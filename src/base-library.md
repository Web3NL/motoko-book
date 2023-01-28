# The Base Library
The Motoko Base Library is a collection of [modules](/common-programming-concepts/modules.html) with basic functionality like *primitive types*, *utilities*, *data structures* and other functionality. 

Most modules define a *public core type* that is associated with the module. 

The Base Library also includes *IC system APIs* that today (Jan 2023) are still experimental. We will visit them [later in this book](/advanced-concepts.html).

## Importing from the Base Library

An [import](/common-programming-concepts/modules.html#imports) from the base library looks like this:

```motoko
{{#include _mo/base-lib.mo:a}}
```

We imported the [`Principle`](/base-library/primitive-types/principal.html) module. The `P` in the example is an arbitrary *alias* (name) that we choose to *reference* our module. The import path starts with `mo:base/` followed by the module name. The module name and our chosen alias name do not have to be the same (like in the example above). 

Our imported module, now named `P`, is of [module type](/common-programming-concepts/modules.html#module-type) `module { ... }`. It exposes several *public types and functions* that we can now reference by using our alias:

```motoko
{{#include _mo/base-lib.mo:b}}
```

We used the `.fromText()` *method* by referencing it through our chosen name `P`.
