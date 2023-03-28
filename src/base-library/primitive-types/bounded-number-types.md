# Bounded Number Types
Unlike [`Nat`](/base-library/primitive-types/nat.html) and [`Int`](/base-library/primitive-types/int.html), which are *unbounded* numbers, the *bounded number types* have a specified *bit length*. Operations that *overflow* (reach numbers beyond the *minimum* or *maximum* value defined by the bit length) on these bounded number types cause a [trap](/advanced-concepts/async-programming/errors-and-traps.html). 

The bounded *natural* number types `Nat8`, `Nat32`, `Nat32`, `Nat64` and the bounded *integer* number types `Int8`, `Int16`, `Int32`, `Int64` are all [*primitive types*](/common-programming-concepts/types.html#primitive-types) in Motoko and don't need to be imported. 

This section covers [*modules*](common-programming-concepts/modules.html) with useful functionality for these types. 

