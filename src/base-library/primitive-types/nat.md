# Nat

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko, run
{{#include _mo/nat.mo:a}}
```

### Conversion

[Function `toText`](#nattotext)

### Comparison

[Function `min`](#natmin)  
[Function `max`](#natmax)  
[Function `compare`](#natcompare)  
[Function `equal`](#natequal)  
[Function `notEqual`](#natnotequal)  
[Function `less`](#natless)  
[Function `lessOrEqual`](#natlessorequal)  
[Function `greater`](#natgreater)  
[Function `greaterOrEqual`](#natgreaterorequal)

### Numerical operations

[Function `add`](#natadd)  
[Function `sub`](#natsub) **Careful!** [Traps](/advanced-concepts/canisters/errors-and-traps.html) if result is a _negative number_  
[Function `mul`](#natmul)  
[Function `div`](#natdiv)  
[Function `rem`](#natrem)  
[Function `pow`](#natpow)

## Nat.toText

```motoko
func toText(n : Nat) : Text
```

The function `toText` takes one `Nat` argument and returns a `Text` value.

```motoko, run
{{#include _mo/nat16.mo:a}}
```

## Nat.min

```motoko
func min(x : Nat, y : Nat) : Nat
```

The function `min` takes two `Nat` arguments and returns the smallest `Nat` value.

```motoko, run
{{#include _mo/nat17.mo:a}}
```

## Nat.max

```motoko
func max(x : Nat, y : Nat) : Nat
```

The function `max` takes two `Nat` arguments and returns the largest `Nat` value.

```motoko, run
{{#include _mo/nat2.mo:a}}
```

## Nat.compare

```motoko
func compare(x : Nat, y : Nat) : {#less; #equal; #greater}
```

The function `compare` takes two `Nat` arguments and returns an [Order](/base-library/utils/order.html) variant value.

```motoko, run
{{#include _mo/nat3.mo:a}}
```

## Nat.equal

```motoko
func equal(x : Nat, y : Nat) : Bool
```

The function `equal` takes two `Nat` arguments and returns a `Bool` value. It is equivalent to the `==` [relational operator](/common-programming-concepts/operators/relational-operators.html).

```motoko, run
{{#include _mo/nat4.mo:a}}
```

## Nat.notEqual

```motoko
func notEqual(x : Nat, y : Nat) : Bool
```

The function `notEqual` takes two `Nat` arguments and returns a `Bool` value. It is equivalent to the `!=` [relational operator](/common-programming-concepts/operators/relational-operators.html)

```motoko, run
{{#include _mo/nat5.mo:a}}
```

## Nat.less

```motoko
func less(x : Nat, y : Nat) : Bool
```

The function `less` takes two `Nat` arguments and returns a `Bool` value. It is equivalent to the `<` [relational operator](/common-programming-concepts/operators/relational-operators.html).

```motoko, run
{{#include _mo/nat6.mo:a}}
```

## Nat.lessOrEqual

```motoko
func lessOrEqual(x : Nat, y : Nat) : Bool
```

The function `lessOrEqual` takes two `Nat` arguments and returns a `Bool` value. It is equivalent to the `<=` [relational operator](/common-programming-concepts/operators/relational-operators.html).

```motoko, run
{{#include _mo/nat7.mo:a}}
```

## Nat.greater

```motoko
func greater(x : Nat, y : Nat) : Bool
```

The function `greater` takes two `Nat` arguments and returns a `Bool` value. It is equivalent to the `>` [relational operator](/common-programming-concepts/operators/relational-operators.html).

```motoko, run
{{#include _mo/nat8.mo:a}}
```

## Nat.greaterOrEqual

```motoko
func greaterOrEqual(x : Nat, y : Nat) : Bool
```

The function `greaterOrEqual` takes two `Nat` arguments and returns a `Bool` value. It is equivalent to the `>=` [relational operator](/common-programming-concepts/operators/relational-operators.html).

```motoko, run
{{#include _mo/nat9.mo:a}}
```

## Nat.add

```motoko
func add(x : Nat, y : Nat) : Nat
```

The function `add` takes two `Nat` arguments and returns a `Nat` value. It is equivalent to the `+` [numeric operator](/common-programming-concepts/operators/numeric-operators.html).

```motoko, run
{{#include _mo/nat10.mo:a}}
```

## Nat.sub

```motoko
func sub(x : Nat, y : Nat) : Nat
```

The function `sub` takes two `Nat` arguments and returns a `Nat` value. It is equivalent to the `-` [numeric operator](/common-programming-concepts/operators/numeric-operators.html).

```motoko, run
{{#include _mo/nat11.mo:a}}
```

> **NOTE**  
> _Both the `Nat.sub` function and the `-` operator on `Nat` values may cause a [trap](/advanced-concepts/canisters/errors-and-traps.html) if the result is a negative number (underflow)._

## Nat.mul

```motoko
func mul(x : Nat, y : Nat) : Nat
```

The function `mul` takes two `Nat` arguments and returns a `Nat` value. It is equivalent to the `*` [numeric operator](/common-programming-concepts/operators/numeric-operators.html).

```motoko, run
{{#include _mo/nat12.mo:a}}
```

## Nat.div

```motoko
func div(x : Nat, y : Nat) : Nat
```

The function `div` takes two `Nat` arguments and returns a `Nat` value. It is equivalent to the `/` [numeric operator](/common-programming-concepts/operators/numeric-operators.html).

```motoko, run
{{#include _mo/nat13.mo:a}}
```

## Nat.rem

```motoko
func rem(x : Nat, y : Nat) : Nat
```

The function `rem` takes two `Nat` arguments and returns a `Nat` value. It is equivalent to the `%` [numeric operator](/common-programming-concepts/operators/numeric-operators.html).

```motoko, run
{{#include _mo/nat14.mo:a}}
```

## Nat.pow

```motoko
func pow(x : Nat, y : Nat) : Nat
```

The function `pow` takes two `Nat` arguments and returns a `Nat` value. It is equivalent to the `**` [numeric operator](/common-programming-concepts/operators/numeric-operators.html).

```motoko, run
{{#include _mo/nat15.mo:a}}
```
