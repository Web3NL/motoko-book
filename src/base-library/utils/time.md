# Time

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#imports) after the [_file name_](/common-programming-concepts/modules.html#type-imports-and-renaming) it is defined in.

The time module exposes one function `now` that returns the IC system time represented as nanoseconds since 1970-01-01 as a `Int`.

```motoko, run
{{#include _mo/time.mo:a}}
```

## Constant time
The system time is constant within one function call and any sub calls. 

```motoko, run
{{#include _mo/time2.mo:a}}
```

We import the module and declare an actor. The Time module exposes one *type* `Time` that that is equal to `Int`. We bring it into scope by [renaming](/common-programming-concepts/modules.html#type-imports-and-renaming) it.

We then declare a [*private function*](/common-programming-concepts/functions.html) `time1` and a [*query function*](/internet-computer-programming-concepts/actors.html#public-shared-query) `time2` that both return the system `Time`. And we declare a third [*update function*](/internet-computer-programming-concepts/actors.html#public-shared-update) `time` that calls the first function, [*awaits*](/advanced-concepts/async-programming.html) the second function and request the system time once more.

All three time values returned in the [tuple](/common-programming-concepts/types/tuples.html) will be *equal*.

## Monotonically increasing time
The time, as observed by the canister smart contract, is *monotonically increasing* after each function call. This is also the case across [canister upgrades](/book/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html).

This means that we are guaranteed to get an increasingly larger `Time` value when calling our function `time` multiple times.    