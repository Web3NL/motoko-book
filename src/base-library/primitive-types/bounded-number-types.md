# Bounded Number Types

Unlike [`Nat`](/base-library/primitive-types/nat.html) and [`Int`](/base-library/primitive-types/int.html), which are _unbounded_ numbers, the _bounded number types_ have a specified _bit length_. Operations that _overflow_ (reach numbers beyond the _minimum_ or _maximum_ value defined by the bit length) on these bounded number types cause a [trap](/advanced-concepts/async-programming/errors-and-traps.html).

The bounded _natural_ number types `Nat8`, `Nat32`, `Nat32`, `Nat64` and the bounded _integer_ number types `Int8`, `Int16`, `Int32`, `Int64` are all [_primitive types_](/common-programming-concepts/types.html#primitive-types) in Motoko and don't need to be imported.

This section covers [_modules_](common-programming-concepts/modules.html) with useful functionality for these types.
