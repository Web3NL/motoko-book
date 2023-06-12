# Time

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#type-imports-and-renaming) it is defined in.

The time module exposes one function `now` that returns the IC system time represented as nanoseconds since 1970-01-01 as an `Int`.

```motoko, run
{{#include _mo/time.mo:a}}
```

## Time is constant within `async` call

The system time is **constant** within one `async` function call and any sub calls.

```motoko, run
{{#include _mo/time2.mo:a}}
```

We [import](/common-programming-concepts/modules.html#type-imports-and-renaming) the [module](/common-programming-concepts/modules.html#public-classes-in-modules) and declare an [actor](/internet-computer-programming-concepts/actors.html). The Time module exposes one _type_ `Time` that that is equal to `Int`. We bring it into scope by [renaming](/common-programming-concepts/modules.html#type-imports-and-renaming) it.

We then declare a [_private function_](/common-programming-concepts/functions.html) `time1` and a [_query function_](/internet-computer-programming-concepts/actors.html#public-shared-query) `time2` that both return the system `Time`. And we declare a third [_update function_](/internet-computer-programming-concepts/actors.html#public-shared-update) `time` that calls the first function, [_awaits_](/advanced-concepts/async-programming.html) the second function and request the system time once more.

All three time values returned in the [tuple](/common-programming-concepts/types/tuples.html) will be _equal_.

## Monotonically increasing time

The time, as observed by the canister smart contract, is _monotonically increasing_ after each function call. This is also the case across [canister upgrades](/book/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html).

This means that we are guaranteed to get an increasingly larger `Time` value when calling our function `time` multiple times.
